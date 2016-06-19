class AddColumsToTags < ActiveRecord::Migration
  def change
    add_column :tags, :description, :text
    add_column :tags, :img, :string
  end
end
