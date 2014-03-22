class CreateStressTracks < ActiveRecord::Migration
  def change
    create_table :stress_tracks do |t|
      t.integer :stressable_id
      t.string :stressable_type
      t.string :name
      t.integer :skill_id

      t.timestamps
    end
  end
end
