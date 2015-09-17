class AddRoleToUser < ActiveRecord::Migration
  def change
  	add_column :users, :role, :string,default: "usuario"
  	add_column :users, :username,:string
  end
end
