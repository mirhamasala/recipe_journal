class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe
    if @measure.save
      redirect_to new_recipe_measure_path(@measure.recipe)
    else
      render :new
    end
  end

  def destroy
    @measure = Measure.find(params[:id])
    @measure.delete
    redirect_to new_recipe_measure_path(@measure.recipe)
  end

  private
  def measure_params
    params.require(:measure).permit(:amount, :unit, :ingredient_id)
  end
end
