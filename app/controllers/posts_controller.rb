class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :content, comments: [:user]).
                  where("user_id IN (?)", current_user.friend_and_self_ids).
                  page(params[:page])
  end

  def show
    @post = Post.includes(comments: [:user]).find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post removed.' }
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
