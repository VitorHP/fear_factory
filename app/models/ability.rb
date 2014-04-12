class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new name: 'Guest'

    if user.persisted?
      can :manage, Character, user_id: user.id
      can :manage, Skill
      can :manage, Aspect
      can :manage, Consequence
      can :manage, Rating
      can :manage, StressTrack
      can :manage, StressLevel
      can :manage, Extra
      can :manage, Stunt
      can :manage, HouseRule, user_id: user.id
      can [:read, :comment, :uncomment, :fave, :like], HouseRule
    else
      can :read, HouseRule
    end
  end
end
