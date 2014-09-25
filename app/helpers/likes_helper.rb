module LikesHelper
  def like_link_for(likable)
    return like_link(likable) if likable.likes.size.zero?

    unless current_user.like?(likable)
      like_link(likable)
    else
      unlike_link(likable)
    end
  end

  def likes_count(likable)
    return if likable.likes.size.zero?
    pluralize(likable.likes.size, 'like')
  end

  def like_link(likable)
    link_to 'Like', [likable, :like], method: :post,
                    remote: true, data: { disable_with: 'Like' }
  end

  def unlike_link(likable)
    link_to 'Unlike', [likable, :like], method: :delete,
                      remote: true, data: { disable_with: 'Unlike' }
  end
end
