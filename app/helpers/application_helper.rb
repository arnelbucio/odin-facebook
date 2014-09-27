module ApplicationHelper
  def notifications_badge
    return if current_user.notifications.pending.empty?
    content_tag(:span, class: 'badge') do
      current_user.notifications.pending.size.to_s
    end
  end

  def remove_link(resource)
    return unless current_user == resource.user
    link_to resource, class: 'close', method: :delete, remote: true,
                      data: { confirm: 'Are you sure you?' } do
                        "&times;".html_safe
    end
  end
end
