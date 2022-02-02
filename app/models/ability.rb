class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Food, user: user
    can :manage, Recipe, user: user
    can :manage, Inventory, user: user
    can :read, Food
    can :read, Recipe, public: true
  end
end
