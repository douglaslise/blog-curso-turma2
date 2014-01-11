class Post < ActiveRecord::Base
	validates :titulo, presence: true, uniqueness: true
  validates :texto, presence: true

  has_many :comentarios
end
