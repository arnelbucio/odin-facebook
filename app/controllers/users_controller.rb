class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.includes(:content, comments: [:user]).
                              page(params[:page]).per(12)
  end
end
