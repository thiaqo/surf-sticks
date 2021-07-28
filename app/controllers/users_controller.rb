class UsersController < ApplicationController
  def dashboard
    @user = User.find(params[:id])


    Booking.joins(:surfboard).where(surfboards: {user_id: user.id}).first

  end
end
