module ApplicationHelper
  def sortable(column, title= nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : "asc"
    link_to title, sort: column, direction: direction
  end

  def page_title(separator = " – ")
    [content_for(:title), 'Wantatrip.com'].compact.join(separator)
  end

  def page_heading(title)
    content_for(:title){ title }
  end

end
