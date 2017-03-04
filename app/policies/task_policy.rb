class TaskPolicy < ApplicationPolicy

  def new?
  	user.manager?
  end

  def show?
  	new?
  end

  def create?
  	new?
  end

  def edit?
  	new?
  end

  def update?
  	new?
  end

  def destroy?
  	new?
  end

  def assign?
    new?
  end

  def assign_activity?
    new?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
