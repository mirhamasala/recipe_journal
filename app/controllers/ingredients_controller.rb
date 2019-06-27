class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_back(fallback_location: new_ingredient_path)
    # Fix logic, add errors
    # if @ingredient.save
    #   redirect_back(fallback_location: new_ingredient_path)
    # else
    #   # if @ingredient.exists?
    #   # render :new
    # end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
