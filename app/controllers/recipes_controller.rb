class RecipesController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :authorize, :only => :edit

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @title = "Recetario | Mmmm!"
    @recipe_title = "Recetario"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @title = @recipe_title = @recipe.name
    @complementos = Recipe.where('lunch_option_id != ?',@recipe.lunch_option_id).sample(3)
    @random_testimony = @recipe.comments.sample if @recipe.comments
    @is_favorite = current_user ? Favorite.where(:recipe_id => @recipe.id, :user_id => current_user.id).length > 0 ? true : false : false

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    3.times {@recipe.ingredients.build}
    @title = "Publica tu receta | Mmmm!"
    @recipe_title = "Publica tu receta"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @title = "Editar: #{@recipe.name} | Mmmm!"
    @recipe_title = "Edita tu receta"
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    @recipe.instructions.gsub!('\\n', '</br>')

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def search
    @title = "Resultados para #{params[:query]}"
    @recipe_title = params[:query]
    @results = []
    @results += Recipe.where('name LIKE ?',"%#{params[:query]}%")
  end
  
  def authorize
    if current_user
      recipe = Recipe.find params[:id]
      if recipe.user_id != current_user.id
        flash[:notice] = "Debes ser el chef para poder editar esta receta!"
        redirect_to recipe
      end
    else
      flash[:notice] = "Debes tener iniciada una sesiíon para acceder a esta página"
      redirect_to new_user_session_url
      return false
    end
  end
end
