class MeasuresController < ApplicationController
  before_action :set_recipe, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
    @measure = Measure.new
    authorize @measure
  end

  def create
    @measure = @recipe.measures.build(measure_params)
    authorize @measure
    if @measure.save
      flash[:notice] = "Yay! You succesfully added #{@measure.ingredient.name}! ☀️"
      redirect_to new_recipe_measure_path(@measure.recipe)
    else
      flash.now[:alert] = "Oops! It looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def destroy
    @measure = Measure.find(params[:id])
    authorize @measure
    @measure.delete
    redirect_back(fallback_location: new_recipe_measure_path(@measure.recipe))
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def measure_params
    params.require(:measure).permit(:amount, :unit, :recipe_id, :ingredient_id)
  end
end
