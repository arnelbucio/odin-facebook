class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.includes(posts: [:content, comments: [:user]]).find(params[:id])
  end
end
