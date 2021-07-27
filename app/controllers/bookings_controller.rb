class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @surfboard = Surfboard.find(params[:surfboard_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @surfboard = Surfboard.find(params[:surfboard_id])
    @booking.surfboard = @surfboard
    # Temporary line of code until we have current_user
    @booking.user = User.all.sample
    # raise
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:collection_date, :return_date)
  end
end
