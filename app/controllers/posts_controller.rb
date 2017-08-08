class PostsController < ApplicationController
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
