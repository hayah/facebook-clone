class UsersController < ApplicationController
  def show
    @post = Post.new
    @posts = Post.where(user_id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      render root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
