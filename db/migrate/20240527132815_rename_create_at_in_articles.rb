class RenameCreateAtInArticles < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :create_at, :created_at
  end
end
