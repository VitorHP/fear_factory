class AddPolymorphicFieldsToRatings < ActiveRecord::Migration
  def up
    add_column :ratings, :rateable_id, :integer
    add_column :ratings, :rateable_type, :string

    Rating.find_each do |r|
      r.rateable_id = r.character_id
      r.rateable_type = 'Character'
    end

    remove_column :ratings, :character_id
  end

  def down
    add_column :ratings, :character_id, :integer

    Rating.find_each do |r|
      r.character_id = r.rateable_id
    end

    remove_column :ratings, :rateable_id
    remove_column :ratings, :rateable_type
  end
end
