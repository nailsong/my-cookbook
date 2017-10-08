class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find params[:id]
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def create
    @recipe = Recipe.create recipe_params
    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      @cuisines = Cuisine.all
      @recipe_types = RecipeType.all
      render :new
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update
    @recipe = Recipe.find params[:id]
    if @recipe.update recipe_params
      redirect_to @recipe
    else
      flash[:error] = 'Você deve informar todos os dados da receita'
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:message] = 'Excluido com sucesso'
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                   :difficulty, :cook_time, :ingredients,
                                   :method)
  end
end
