class BuildCharacter
  def build(character_kind)
    case character_kind
      when "changeling"
        build_changeling
      else
        build_human
    end
  end

  private

  def build_human
    Character.new do |character|
      character.kind = "human"

      Skill.find_each do |s|
        character.ratings.build skill_id: s.id
      end
    end
  end

  def build_changeling
    build_human.tap do |character|
      character.kind = "changeling"

      character
        .ratings
        .select { |r| SkillGroup::ATTRIBUTES.include?(r.skill.skill_group_id) }.each do |r|
          r.level = 1
        end

      character
        .ratings
        .select { |r| r.skill.skill_group_id == SkillGroup::SUPERNATURAL_POWER }.each do |r|
          r.level = 1
        end

    end
  end
end
