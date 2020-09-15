class RemoveEpisodeFromPictures < ActiveRecord::Migration[6.0]
  def change
    remove_column :pictures, :episode, :integer
    remove_column :pictures, :serif, :string
  end
end
