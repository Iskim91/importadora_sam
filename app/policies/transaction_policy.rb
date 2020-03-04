class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    record.user == current_user
  end

  def update?
    record.user == current_user
  end

  def edit?
    update?
  end

  def confirmation?
    true
  end
end
