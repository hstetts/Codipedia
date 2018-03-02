class WikiPolicy < ApplicationPolicy

 # class Scope < Scope
 #   def resolve
 #     scope
 #   end
 # end

  def index?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def show?
   true
  end


#
#   def update?
#     @user && @user.wiki == @wiki
#   end
#
#   def edit?
#     @user && @user.wiki == @wiki
#   end
#
#   def destroy?
#     @user && @user.wiki == @wiki
#   end
#
#
#
end
