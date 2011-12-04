class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.role == "compagnie"
    can :manage, Roster, :user_id => user.id if (user.role =="personnel") || user.role.nil?
    can :manage, User, :id => user.id if (user.role =="personnel") || user.role.nil?
    can :manage, Roster if user.role == "section"
  end
end