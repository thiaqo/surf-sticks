class UsersController < ApplicationController
  def dashboard
    @user = User.find(current_user.id)

    # Surfboard bookings - where user is the owner of the surfboard
    @surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
    @upcoming_surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                  .where(bookings: { accepted: true }).where("collection_date >= ?", Date.today)
    @current_surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                .where(bookings: { accepted: true }).where("collection_date < ?", Date.today)
                                .where("return_date >= ?", Date.today)
    @pending_surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                .where(bookings: { accepted: nil }).where("collection_date >= ?", Date.today)
    @past_surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                              .where(bookings: { accepted: true }).where("return_date < ?", Date.today)

    # User bookings - where user is the renter of the surfboard
    @user_bookings = User.find(current_user.id).bookings
    @upcoming_user_bookings = @user_bookings.select{ |booking| booking.accepted == true && booking.collection_date >= Date.today }
    @current_user_bookings = @user_bookings.select { |booking| booking.accepted == true && booking.collection_date < Date.today && booking.return_date >= Date.today }
    @pending_user_bookings = @user_bookings.select { |booking| booking.accepted == nil && booking.collection_date >= Date.today }
    @past_user_bookings = @user_bookings.select { |booking| booking.accepted == true && booking.return_date < Date.today }
  end
end
