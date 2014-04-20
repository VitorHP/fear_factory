class PyramidSkillBuilder
  def initialize skill_type
    @skill_type = skill_type
  end

  def build character, campaign
    @skill_type.pyramid.each do |level|
      character.ratings.build level: level
    end
  end
end
