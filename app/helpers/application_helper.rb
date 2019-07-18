module ApplicationHelper
def header(text)
  content_for(:header) { text.to_s }
end

def user_avatar(user, size=40)
	user.avatar.variant(resize: "#{size}x#{size}!")
end
end
