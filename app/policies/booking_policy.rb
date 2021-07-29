class BookingPolicy < ApplicationPolicy


  def show?
    user = record.user || user = record.surfboard.user
  end

  def create?
    user != record.surfboard.user
  end

  def new?
    user != record.surfboard.user
  end

  def update?
    user = record.user || user = record.surfboard.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
