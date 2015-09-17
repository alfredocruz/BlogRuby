class Ability
    include CanCan::Ability
    def initialize(user)
    # Define abilities for the passed in user here. For example:
        user ||= User.new # guest user (not logged in)
        if user.role == "admin"
            can :manage, :all
        elsif user.role == ("autor")
            can :read, Tag
            can :read, Article
            can :create, :all
            can :update, Article do |article|
                article.try(:user)== user
            end
        elsif user.role == "usuario"
            can :read, Tag
            can :read, Article
            can :manage, :all
        else
            can :read,:all
        end
    end
end
