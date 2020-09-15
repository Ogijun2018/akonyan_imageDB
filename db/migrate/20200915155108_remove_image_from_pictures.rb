class RemoveImageFromPictures < ActiveRecord::Migration[6.0]
  def change
    remove_column :pictures, :image, :string
  end
end
