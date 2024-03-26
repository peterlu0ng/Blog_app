class UsersController < ApplicationController
  def new
    @user = User.new
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
