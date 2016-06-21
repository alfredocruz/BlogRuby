class Ability
    include CanCan::Ability
    def initialize(user)
    # Define abilities for the passed in user here. For example:
        user ||= User.new # guest user (not logged in)
        if user.email == "alfredo_92-ca@hotmail.com"
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
        else
            can :read,:all
        end
    end
end
