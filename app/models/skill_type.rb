class SkillType < ActiveRecord::Base
  has_many :campaigns

  serialize :pyramid, Array

  validates :name, presence: true

  before_create :build_alias

  def build_skills options
    character = options.fetch(:for)

    [4,3,3,2,2,2,1,1,1,1].each do |level|
      character.ratings.build level: level
    end

    # skills_builder(campaign).new(self).build character, campaign
  end

  private

  def build_alias
    self.alias = name.parameterize
  end

  def skills_builder
    begin
      "#{self.alias.underscore.camelize}SkillBuilder".constantize
    rescue NameError
      raise SkillBuilderNotFoundError
    end
  end
end
