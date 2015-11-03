module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, request.parameters.except(:utf8).merge(sort: column, direction: direction)
  end
end
