class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.integer :number_of_aspects
      t.integer :number_of_phases
      t.integer :skill_type_id
      t.integer :refresh_rate
      t.integer :number_of_initial_stunts
      t.integer :number_of_stress_boxes

      t.timestamps
    end
  end
end
