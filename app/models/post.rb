class Post < ActiveRecord::Base
	validates :titulo, presence: true, uniqueness: true
  validates :texto, presence: true

  has_many :comentarios

  scope :publicados, ->{ where(publicado: true) }
  scope :mais_recentes, ->{ order(created_at: :desc) }
end
