class SkillType < ActiveRecord::Base
  has_many :campaigns

  serialize :pyramid, Array

  validates :name, presence: true

  before_create :build_alias

  def build_skills options
    character = options.fetch(:for)
    campaign =  options.fetch(:in)

    skills_builder.new(self).build character, campaign
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
