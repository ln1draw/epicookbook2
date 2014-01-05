class RenameFiltersToDietaryRestrictions < ActiveRecord::Migration
  def change
    rename_table :filters, :dietary_restrictions
  end
end
