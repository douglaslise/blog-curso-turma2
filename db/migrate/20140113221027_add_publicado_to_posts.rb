class AddPublicadoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publicado, :boolean
  end
end
