class CreateHouseRules < ActiveRecord::Migration
  def change
    create_table :house_rules do |t|
      t.string :name
      t.text :thirty_second_version
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
