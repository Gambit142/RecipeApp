class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food
    can :read, Recipe, public: true
    can :manage, Food, user: user
    can :manage, Recipe, user: user
    can :manage, Inventory, user: user
    return unless user

    can :manage, FoodsRecipe if user  # TODO: handle FoodRecipe permissions correctly
  end
end
