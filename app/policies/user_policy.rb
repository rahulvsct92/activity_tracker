class UserPolicy < ApplicationPolicy

	def index?
		user.manager?
  end

  def new?
  	index?
  end

  def show?
  	index?
  end

  def create?
  	index?
  end

  def edit?
  	index?
  end

  def update?
  	index?
  end

  def destroy?
  	index?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
