class AddKindToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :kind, :string
  end
end
