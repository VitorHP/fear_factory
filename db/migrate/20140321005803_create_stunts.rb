class CreateStunts < ActiveRecord::Migration
  def change
    create_table :stunts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
