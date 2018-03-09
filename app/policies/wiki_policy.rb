class WikiPolicy < ApplicationPolicy

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

  def destroy?
    record.user == user
  end

  def update?
    user.present?
  end

  def edit?
    !record.private?
  end

end
