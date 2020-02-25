class MeasuresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:index, :new, :create, :edit]
  before_action :set_ingredient, only: [:create]

  def index
    @measures = policy_scope(@recipe.measures)
  end

  def new
    # @measure = @recipe.measures.build => What's up with this?
    @measure = Measure.new
    authorize @measure
  end

  def create
    @measure = @recipe.measures.build(measure_params)
    authorize @measure
    if @measure.save!
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


  def set_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def measure_params
    params.require(:measure).permit(:amount, :unit, :recipe_id, :ingredient_id)
  end
end
