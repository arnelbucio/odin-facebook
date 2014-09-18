module UsersHelper
  def user_avatar(user, version = :thumb)
    image_tag(user.avatar.send(version).url, alt: user.name, class: 'avatar')
  end
end
