class RenameNameColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :name, :title
  end
end
