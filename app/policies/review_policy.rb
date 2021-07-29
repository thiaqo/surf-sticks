class ReviewPolicy < ApplicationPolicy
  def new?
    review_permission
  end

  def create?
    review_permission
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  # Check that user is not same as owner of surboard and that time since booking ended is 0-14 days
  def review_permission
    time_elapsed = (Date.today - record.booking.return_date).to_i
    user != record.booking.surfboard.user && time_elapsed.positive? && time_elapsed < 14
  end
end
