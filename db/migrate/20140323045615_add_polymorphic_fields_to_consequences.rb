class AddPolymorphicFieldsToConsequences < ActiveRecord::Migration
  def up
    add_column :consequences, :consequential_id, :integer
    add_column :consequences, :consequential_type, :string
  end

  def down
    remove_column :consequences, :consequential_id
    remove_column :consequences, :consequential_type
  end
end
