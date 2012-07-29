module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
    return page_title
  end

  def current_name
  	current_user.username || current_user.email
  end

end
