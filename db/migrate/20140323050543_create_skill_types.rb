class CreateSkillTypes < ActiveRecord::Migration
  def change
    create_table :skill_types do |t|
      t.string :name
      t.text :pyramid
      t.integer :number_of_columns
      t.integer :number_of_points

      t.timestamps
    end
  end
end
