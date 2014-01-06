class CreateDrUsers < ActiveRecord::Migration
  def change
    create_table :dr_users do |t|
      t.integer :user_id
      t.integer :dietary_restriction_id

      t.timestamps
    end
  end
end
