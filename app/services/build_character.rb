class BuildCharacter
  def build options = {}
    @campaign = options.fetch(:campaign)
    @user = options.fetch(:user)

    @user.characters.build do |character|
      build_aspects character
      build_stunts character
      build_extras character

      [4, 3, 3, 2, 2, 2, 1, 1, 1, 1].each do |level|
        character.ratings.build level: level
      end

      stress_tracks = [
        {name: 'mental stress', skill_id: 18},
        { name: 'physical stress', skill_id: 12}
      ]

      stress_tracks.reverse.each do |skill|
        character.stress_tracks.build(name: skill[:name], skill_id: skill[:skill_id]) do |stress_track|
          [1, 2, 3, 4].each do |level|
            stress_track.stress_levels.build level: level
          end
        end
      end

      consequences = [
        {name: 'mild', level: 2},
        {name: 'moderate', level: 4},
        {name: 'severe', level: 6},
        {name: 'mild', level: 2, skill_id: 12, skill_level_to_unlock: 5},
      ]

      consequences.each do |consequence|
        character.consequences.build consequence
      end

    end
  end

  private

  def build_aspects character
    @campaign.number_of_aspects.to_i.times { character.aspects.build }
  end

  def build_stunts character
    @campaign.number_of_initial_stunts.to_i.times { character.stunts.build }
  end

  def build_extras character
    3.times { character.extras.build }
  end
end
