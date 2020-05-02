class SubfedPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: session[:user_id])
    end
  end

  def new?
    user
  end

  def create?
    user
  end

  def show
    user
  end

  def update?
    return true if user.record == user
  end

  def destroy?
    return true if user.record == user
  end

  private
  def subfed
    record
  end
end
