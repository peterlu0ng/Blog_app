class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end
  def new
    @user = User.new
  end
  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was updated successfully"
      redirect_to blogs_path
    else
      render 'edit'
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Blog #{@user.username}, you have sucessfully signed up"
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end