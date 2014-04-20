class ListSkillBuilder
  def initialize skill_type
    @skill_type = skill_type
  end

  def build character, campaign
    campaign.skills.each do |skill|
      character.ratings.build skill_id: skill.id
    end
  end
end
