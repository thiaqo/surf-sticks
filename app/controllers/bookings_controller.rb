class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :update]

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

  def show; end

  def update
    @booking.accepted = accepted_to_boolean
    @booking.save
    redirect_to dashboard_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:collection_date, :return_date)
  end

  def accepted_to_boolean
    params[:booking][:accepted] == "true"
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
