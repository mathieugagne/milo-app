module TablesHelper

  def sortable_header column, title=nil
    title ||= column.to_s.titleize
    direction = is_sorted_column?(column) && is_ascending? ? "desc" : "asc"
    link_to title, { sort: column, direction: direction, q: params[:q] }
  end

  private

  def is_sorted_column?(column)
    column.to_s == sort_column.to_s
  end

  def is_ascending?
    sort_direction.to_s == "asc"
  end

end