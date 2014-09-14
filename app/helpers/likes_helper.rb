module LikesHelper
  def like_link_for(likable)
    content_tag_for(:span, likable, :like) do
      if likable.likes.empty? || !current_user.like?(likable)
        like_link(likable)
      else
        unlike_link(likable)
      end
    end
  end

  private

  def like_link(likable)
    link_to 'Like', [likable, :like], method: :post
  end

  def unlike_link(likable)
    link_to 'Unlike', [likable, :like], method: :delete
  end
end
