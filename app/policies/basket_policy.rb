class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user == record.user
  end

  def index?
    user == record.user
  end

  def show?
    user == record.user
  end
  def payment?
    user == record.user
  end
end
