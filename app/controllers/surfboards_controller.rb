class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
  end

  def show
    @surfboard = Surfboard.find(params[:id])
    # raise
  end

  def new
  end

  def edit
  end
end
