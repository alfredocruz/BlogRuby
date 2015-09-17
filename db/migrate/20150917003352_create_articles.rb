class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
     	t.string :title
      	t.text :body
      	t.integer :visits_count
      	t.string :link_des
      	t.float :tamano
      	t.string :markup_body
      	t.string :image

      	t.timestamps null: false
    end
  end
end
