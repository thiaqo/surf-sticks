class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    raise
    @booking = Booking.new(booking_params)
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
    params.require(@booking).permit(:collection_date, :return_date)
  end
end
