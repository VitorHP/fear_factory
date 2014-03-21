class CreateStunts < ActiveRecord::Migration
  def change
    create_table :stunts do |t|
      t.string :name
      t.text :description
      t.integer :stuntable_id
      t.string :stuntable_type

      t.timestamps
    end
  end
end
