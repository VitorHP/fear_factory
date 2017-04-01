class BuildCharacter
  def build(character_type)
    case character_type
      when "changeling"
        build_changeling
      else
        build_human
    end
  end

  private

  def build_human
    Character.new do |character|
      character.type = "human"

      Skill.find_each do |s|
        character.ratings.build skill_id: s.id
      end
    end
  end

  def build_changeling
    build_human.tap do |character|
      character.type = "changeling"

      character
        .ratings
        .select { |r| SkillGroup::ATTRIBUTES.include?(r.skill.skill_group_id) }.each do |r|
          r.level = 1
        end
    end
  end
end
