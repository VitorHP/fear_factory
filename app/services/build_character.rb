class BuildCharacter
  def build_human
    Character.new do |character|
      Skill.find_each do |s|
        character.ratings.build skill_id: s.id
      end
    end
  end

  def build_changeling
    build_human.tap do |human|
      human
        .ratings
        .select { |r| SkillGroup::ATTRIBUTES.include?(r.skill.skill_group_id) }.each do |r|
          r.level = 1
        end
    end
  end
end
