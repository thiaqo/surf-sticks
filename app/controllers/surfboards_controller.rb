class SurfboardsController < ApplicationController
  def index
    @surfboards = policy_scope(Surfboard).order(created_at: :desc)
    @surfboards = @surfboards.reject { |surfboard| surfboard.user == current_user }
  end

  def show
    @surfboard = Surfboard.find(params[:id])
    @booking = Booking.new(surfboard: @surfboard)
    authorize @surfboard
  end

  def new
    @surfboard = Surfboard.new
    @user = User.find(params[:user_id])
    authorize @surfboard
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = User.find(params[:user_id])
    authorize @surfboard
    if @surfboard.save
      redirect_to surfboard_path(@surfboard), notice: 'Surfboard was successfully created.'
    else
      render :new
    end
  end

  def edit
    @surfboard = Surfboard.find(params[:id])
    authorize @surfboard
  end

  def update
    @surfboard = Surfboard.find(params[:id])
    @surfboard.update(surfboard_params)
    authorize @surfboard
    redirect_to surfboard_path(@surfboard)
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:name, :length, :volume, :price_per_day, :board_type, :fin_type, :brand, :description, :photo, :address)
  end
end
