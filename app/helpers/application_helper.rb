module ApplicationHelper
  # Produces a link_to, adjusting CSS class if link is to current controller
  def li_link_with_class(options)
    title = options[:title]
    options.delete(:title) # to avoid being used by link_to
    if current_page?(options)
      ('<li class="active">' + link_to(title, options) + '</li>').html_safe
    else
      ('<li>' + link_to(title, options) + '</li>').html_safe
    end
  end
end
