class AddsCorrectColumnsToFilters < ActiveRecord::Migration
  def change
    add_column :dietary_restrictions, :name, :string
    add_column :dietary_restrictions, :popular, :string
    add_column :dietary_restrictions, :no_list, :array
  end
end
