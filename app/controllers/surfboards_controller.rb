class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
