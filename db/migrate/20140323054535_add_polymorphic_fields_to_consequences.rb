class AddPolymorphicFieldsToConsequences < ActiveRecord::Migration
  def up
    add_column :consequences, :consequential_id, :integer
    add_column :consequences, :consequential_type, :string

    Consequence.find_each do |r|
      r.consequential_id = r.character_id
      r.consequential_type = 'Character'
      r.save
    end

    remove_column :consequences, :character_id
  end

  def down
    add_column :consequences, :character_id, :integer

    Consequence.find_each do |r|
      r.character_id = r.consequential_id
    end

    remove_column :consequences, :consequential_id
    remove_column :consequences, :consequential_type
  end
end
