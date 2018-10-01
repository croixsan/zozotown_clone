class AddColorToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :color, :string
  end
end
