class UserPolicy < ApplicationPolicy
  def dashboard?
    user = record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
