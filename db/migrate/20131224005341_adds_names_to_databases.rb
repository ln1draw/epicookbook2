class AddsNamesToDatabases < ActiveRecord::Migration
  def change
    add_column :ingredients, :name, :string
    add_column :recipes, :name, :string
  end
end
