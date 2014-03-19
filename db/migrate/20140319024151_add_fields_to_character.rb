class AddFieldsToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :description, :text
    add_column :characters, :refresh, :integer
  end
end
