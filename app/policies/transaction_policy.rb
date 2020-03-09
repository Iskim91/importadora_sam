class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user == record.user
  end

  def index?
    true
  end

  def show?
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

end
