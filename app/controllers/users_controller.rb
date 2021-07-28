class UsersController < ApplicationController
  def dashboard
    @user = User.find(current_user.id)

    # Surfboard bookings - where user is the owner of the surfboard
    surfboard_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
    @surfboard_upcoming_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                  .where(bookings: { accepted: true }).where("collection_date >= ?", Date.today)
    @surfboard_current_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                .where(bookings: { accepted: true }).where("collection_date < ?", Date.today)
                                .where("return_date >= ?", Date.today)
    @surfboard_pending_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                                .where(bookings: { accepted: nil }).where("collection_date >= ?", Date.today)
    @surfboard_past_bookings = Booking.joins(:surfboard).where(surfboards: { user_id: @user.id })
                              .where(bookings: { accepted: true }).where("return_date < ?", Date.today)
    @surfboard_bookings_size = (@surfboard_upcoming_bookings.size + @surfboard_current_bookings.size + @surfboard_pending_bookings.size + @surfboard_past_bookings.size)

    # User bookings - where user is the renter of the surfboard
    user_bookings = User.find(current_user.id).bookings
    @user_upcoming_bookings = user_bookings.select{ |booking| booking.accepted == true && booking.collection_date >= Date.today }
    @user_current_bookings = user_bookings.select { |booking| booking.accepted == true && booking.collection_date < Date.today && booking.return_date >= Date.today }
    @user_pending_bookings = user_bookings.select { |booking| booking.accepted == nil && booking.collection_date >= Date.today }
    @user_past_bookings = user_bookings.select { |booking| booking.accepted == true && booking.return_date < Date.today }
    @user_bookings_size = (@user_upcoming_bookings.size + @user_current_bookings.size + @user_pending_bookings.size + @user_past_bookings.size)
  end
end
