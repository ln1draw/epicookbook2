class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_recipe]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.filter(params[:dietary_restrictions], params[:search_term])
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  def add_recipe
    @current_user.add_recipe(@recipe.id)
    redirect_to :back, notice: "Recipe has been added to your cookbook!"
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all.collect { |p| [p.name, p.id] }
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    # this block exists because users are broken right now. It should
    # be deleted once the user authentication error is resolved.
    if @current_user.nil?
      @recipe.user_id = 1
    else
      @recipe.user_id = @current_user.id
    end
    @ingredients = Ingredient.all.collect { |p| [p.name, p.id] }
    these_ingredients = params[:ingredients].split
    these_amounts = params[:amount].split
    these_units = params[:unit].split
    @recipe.add_ingredients(these_ingredients)

    respond_to do |format|
      if @recipe.save
        unless @current_user.nil?
          @current_user.add_recipe(@recipe.id)
        end
        @recipe.ingredients.each_with_index do |ingredient, i| 
          @recipe.set_amount_and_unit(ingredient.id, these_amounts[i], these_units[i])
        end

        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :image, :amount, :unit, :ingredients => {}, :steps => {})
    end
end
