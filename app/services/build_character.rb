class BuildCharacter
  def build_human options = {}
    Character.new do |character|
      Skill.each do |s|
        character.ratings.build skill_id: s.id
      end
    end
  end
end
