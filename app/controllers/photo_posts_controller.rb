class PhotoPostsController < ApplicationController
  def create
    post = build_post
    if post.save
      redirect_to post, notice: 'Post created.'
    else
      redirect_to root_path, notice: 'Cannot create post.'
    end
  end

  private

  def build_post
    photo_post = PhotoPost.new(photo_post_params)
    current_user.posts.build(content: photo_post)
  end

  def photo_post_params
    params.require(:photo_post).permit(:photo)
  end
end
