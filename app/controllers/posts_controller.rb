class PostsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user)
    else
      render :edit
    end
  end

  def create
    @user = User.first
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to request.referer
    else
      render root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
