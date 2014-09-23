class TextPostsController < ApplicationController
  def create
    post = build_post
    if post.save
      redirect_to post, notice: 'Post created.'
    else
      redirect_to root_path, alert: 'Content cannot be blank.'
    end
  end

  private

  def build_post
    text_post = TextPost.new(text_post_params)
    current_user.posts.build(content: text_post)
  end

  def text_post_params
    params.require(:text_post).permit(:content)
  end
end
