class AddColunmToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :datos, :string
    add_column :articles, :pesodatos, :float
  end
end
