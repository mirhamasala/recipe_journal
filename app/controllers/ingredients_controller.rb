class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.create(ingredient_params)
    authorize @ingredient
    if @ingredient.save
      flash[:notice] = "Yay! You succesfully added #{@ingredient.name}! ☀️"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Oops! It looks like something went wrong. Please, try again. 🌈"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
