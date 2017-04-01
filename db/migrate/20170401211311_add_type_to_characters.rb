class AddTypeToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :type, :string
  end
end
