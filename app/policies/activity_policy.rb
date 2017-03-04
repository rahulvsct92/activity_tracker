class ActivityPolicy < ApplicationPolicy

	def index?
		user.manager? || user.employee?
  end

  def new?
  	index?
  end

  def show?
  	user.manager? || (user.employee? && record.user_id == user.id && user.tasks.include?(record.task))
  end

  def create?
  	index?
  end

  def edit?
  	show?
  end

  def update?
  	show?
  end

  def destroy?
  	show?
  end

  class Scope < Scope
    def resolve
    	if user.manager?
        scope.all
      elsif user.employee?
      	scope.where(user_id: user.id)
      end
    end
  end
end
