class Presenters::Character < SimpleDelegator
  def class
    __getobj__.class
  end

  def merits
    mental_merits + physical_merits + social_merits
  end
end

Presenters::Character.class_eval do
  [
    'physical_attributes',
    'mental_attributes',
    'social_attributes',

    'physical_skills',
    'mental_skills',
    'social_skills',

    'physical_merits',
    'mental_merits',
    'social_merits',

    'health',
    'morality',
    'willpower',

    'supernatural_power',
    'supernatural_fuel',
  ].each do |w|
    define_method w.to_sym do
      self.ratings
        .select { |r| r.skill.skill_group_id == SkillGroup.const_get(w.upcase.to_sym) }
    end
  end
end
