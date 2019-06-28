class MeasuresController < ApplicationController
  before_action :set_recipe, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
    @measure = Measure.new
    authorize @measure
  end

  def create
    @measure = @recipe.measures.create(measure_params)
    authorize @measure
    if @measure.save
      redirect_back(fallback_location: new_recipe_measure_path(@measure.recipe))
    else
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
    params.require(:measure).permit(:amount, :unit, :ingredient_id)
  end
end
