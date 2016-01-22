class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :version, :string
  end
end
