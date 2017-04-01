class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :skill_id
      t.integer :character_id
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
