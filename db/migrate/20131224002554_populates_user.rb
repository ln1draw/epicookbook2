class PopulatesUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :username, :string
    add_column :users, :email_address, :string
    add_column :users, :password, :string
  end
end
