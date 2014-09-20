module ApplicationHelper

  def item_menu(title, path)
    content_tag(:li, link_to(I18n.t(title), path), :class => (current_page?(path) ? 'active' : ''))
  end

end
