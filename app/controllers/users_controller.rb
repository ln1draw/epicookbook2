class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    if current_user.present?
    else
      redirect_to '/sessions/new', notice: "Please login."
    end 
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_email(params[:email])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
