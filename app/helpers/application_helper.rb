module ApplicationHelper

  def active?(path)
    "active" if current_page?(path) # help with styling a list item on the nav bar as active.
  end

  def login_helper style = '' # by default just dont have a class for the style.
    # when logged in you are only a User. you are not a User if logged out, but a GuestUser.
    if current_user
      link_to "logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
          " ".html_safe +
          (link_to "Login", user_session_path, class: style)
    end
  end

  def nav_items
    # add items that any user can see.
    nav_items = [
        {
            url: root_path,
            title: 'Home'
        }
    ]
    if current_user
      add_nav_items_for_logged_in_user nav_items # add items that only logged in users can see.
    end
    nav_items
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |nav_item|
        nav_links << "<#{tag_type}><a href='#{nav_item[:url]}' class='#{style} #{active? nav_item[:url]}'>
            #{nav_item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def copyright_generator name = 'Todd Tran', msg = 'All Rights Reserved'
    @copyright = "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end

  def add_nav_items_for_logged_in_user nav_items
    nav_items << {
        url: forecasts_user_searches_path,
        title: 'Look-up Past Searches'
    }
  end

  def datetime_to_formatted_string datetime
    datetime.in_time_zone.strftime("%b %e %Y at %l:%M %p %Z")
  end

end
