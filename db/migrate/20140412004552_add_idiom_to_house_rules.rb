class AddIdiomToHouseRules < ActiveRecord::Migration
  def change
    add_column :house_rules, :idiom, :string
  end
end
