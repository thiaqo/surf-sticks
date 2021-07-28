class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @surfboard = Surfboard.find(params[:surfboard_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @surfboard = Surfboard.find(params[:surfboard_id])
    @booking.surfboard = @surfboard
    @booking.user = User.find(current_user.id)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:collection_date, :return_date)
  end
end
