class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name
      t.integer :campaign_id

      t.timestamps null: false
    end
  end
end
