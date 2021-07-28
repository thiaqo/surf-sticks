class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
  end

  def show
    @surfboard = Surfboard.find(params[:id])
    # raise
  end

  def new
    @surfboard = Surfboard.new
    @user = User.find(params[:user_id])
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = User.find(params[:user_id])
    if @surfboard.save
      redirect_to surfboard_path(@surfboard), notice: 'Surfboard was successfully created.'
    else
      render :new
    end
  end

  def edit
    @surfboard = Surfboard.find(params[:id])
  end

  def update
    @surfboard = Surfboard.find(params[:id])
    @surfboard.update(surfboard_params)
    redirect_to surfboard_path(@surfboard)
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:length, :volume, :price_per_day, :board_type, :fin_type, :brand, :description)
  end
end
