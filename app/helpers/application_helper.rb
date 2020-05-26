module ApplicationHelper
  include Pagy::Frontend
  def show_flashes(flash)
    return_html = ''
    flash.each do |message_type, message|
      return_html += tag.div(message, class: "alert alert-#{message_type}")
    end
    return_html.html_safe
  end

  def header_user_menu
    return_html = ''
    if user_signed_in?
      return_html =
        "<li class='nav-item dropdown'>
      <a class='nav-link dropdown-toggle' href='#' id='navbarDropdown'
      role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
        Account
      </a>
      <div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdown'>"
      return_html += link_to('Settings', edit_registration_path(current_user), class: 'dropdown-item')
      return_html += link_to('New Article', articles_new_path, class: 'dropdown-item')
      return_html += link_to('My Articles', articles_path(params: {author_id: current_user.id}), class: 'dropdown-item')
      return_html += "<div class='dropdown-divider'></div>"
      return_html += link_to('Logout', destroy_user_session_path, method: :delete, class: 'dropdown-item')
      return_html += '</div>'
    else
      return_html += "<li class='nav-item'>"
      return_html += link_to('Log in', new_session_path(:user), class: 'nav-link')
      return_html += '</li>'
      return_html += "<li class='nav-item'>"
      return_html += link_to('Register', new_registration_path(:user), class: 'nav-link')
      return_html += '</li>'
    end
    return_html.html_safe
  end
end
