class CreateStressLevels < ActiveRecord::Migration
  def change
    create_table :stress_levels do |t|
      t.integer :stress_track_id
      t.integer :level
      t.boolean :checked

      t.timestamps
    end
  end
end
