class CreateConsequences < ActiveRecord::Migration
  def change
    create_table :consequences do |t|
      t.string :name
      t.string :description
      t.integer :level
      t.integer :character_id
      t.integer :skill_id
      t.integer :skill_level_to_unlock

      t.timestamps
    end
  end
end
