module ApplicationHelper

  def login_helper style
    if logged_in?
      (link_to "Profile", user_path(current_user), class: style) +
      (link_to "Logout", logout_path, method: :delete, class: style)
    else
      (link_to "Register", register_path, class: style) +
      (link_to "Login", login_path, class: style)
    end
  end

  def nav_bar_items
    [
      { url: root_path, title: "Home"},
      { url: users_path, title: "Users"},
      { url: questions_path, title: "Questions"}
    ]
  end

  def left_side_bar_items
    [
      { url: questions_path, title: "Questions"},
      { url: "#", title: "Questions"},
      { url: "#", title: "Questions"},
      { url: "#", title: "Questions"},
    ]
  end

  def nav_helper items, a_style, li_style = ""
    nav_links = ""
    items.each do |item|
      nav_links << "<li class='#{li_style}'><a href='#{item[:url]}'" <<
      " class='#{a_style} #{active? item[:url]}'>#{item[:title]}</a></li>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def most_used_tags
    QuestionTag.joins(:tag).group(:name).count.sort_by {|k,v| v}.reverse
  end
end
