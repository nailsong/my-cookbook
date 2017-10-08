class CuisinesController < ApplicationController
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new cuisine_params
    if @cuisine.save
      redirect_to @cuisine
    else
      render :new
    end
  end

  def show
    @cuisine = Cuisine.find params[:id]
    @recipes = @cuisine.recipes
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
