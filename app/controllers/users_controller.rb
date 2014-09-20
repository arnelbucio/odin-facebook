class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:content, comments: [:user]]).find(params[:id])
  end
end
