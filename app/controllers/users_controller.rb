class UsersController < ApplicationController
  before_action :new_post, only: [:show, :home]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      render welcome_path
    end
  end

  def home
    @posts = Post.where(user: current_user)
    @user = current_user
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def new_post
    @post = Post.new
  end
end
