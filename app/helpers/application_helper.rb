module ApplicationHelper
  def notifications_badge
    return if current_user.notifications.pending.empty?
    content_tag(:span, class: 'badge') do
      current_user.notifications.pending.size.to_s
    end
  end
end
