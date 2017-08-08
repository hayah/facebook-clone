class UsersController < ApplicationController
  def show
    @post = Post.new
    @posts = Post.where(user_id: params[:id])
  end
end
