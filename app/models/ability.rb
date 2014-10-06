# Internal: User permissions
#
# This model describe users permisions. It SHOULD NOT be called directly.
# Instead of that use `can?` method in controllers/views (sic!).
#
# Example:
#
#     class Ability
#       include CanCan::Ability
#
#       def initialize(user)
#         @user ||= User.new
#
#         can :read, :all
#       end
#     end
#
#     # Somewhere else
#     can? :edit, User # => false
class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter
    # the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities

    [Blog::Post, Convention].each do |model|
      can :read, model
    end
  end

  def admin
    can :manage, :all
  end

  def organisator
    can :manage, Blog::Post
    can :manage, Participant
    can :manage, Role
  end

  protected

  def user
    @user ||= User.new
  end
end
