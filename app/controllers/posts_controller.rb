class PostsController < ApplicationController
  def index
    @posts = Post.where("user_id IN (?)", current_user.friend_and_self_ids)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to root_path, notice: 'Post created.'
    else
      redirect_to root_path, notice: 'Post not created.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
