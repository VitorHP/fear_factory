class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.string :name
      t.string :aspectable_type
      t.string :aspectable_id

      t.timestamps
    end
  end
end
