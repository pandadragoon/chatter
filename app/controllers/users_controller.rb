class UsersController < ApplicationController 

  def show
    @user = User.find_by username: params[:username]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You have registered!"
      redirect_to user_path(@user.username)
    else
      flash[:error] = "You were unable to register."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end