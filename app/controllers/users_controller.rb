class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "¡Registrado!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = User.find params[:id]
    if @user == current_user
      redirect_to public_profile_path
    end
  end
  
  def public_profile
    @user = User.find current_user.id
    render 'show'
  end

  def edit
    if @current_user
      @user = @current_user
    else
      redirect_to login_url
    end
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "¡Perfil actualizado!"
      redirect_to profile_url
    else
      render :action => :edit
    end
  end

  def favorite_recipes
    @title = @recipe_title = "Mi recetario"
    @my_recipes = Recipe.where(:user_id => current_user.id)
    @my_favorite_recipes = Favorite.where(:user_id => current_user.id)
  end

  def index
    @title = "Chefs"
    @recipe_title = "Nuestros chefs"
    @chefs = User.all
  end
end
