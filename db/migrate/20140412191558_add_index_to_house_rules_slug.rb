class AddIndexToHouseRulesSlug < ActiveRecord::Migration
  def change
    add_column :house_rules, :slug, :string
    add_index :house_rules, :slug, unique: true
  end

  def down
    remove_index :house_rules, :slug
    remove_column :house_rules, :slug
  end
end
