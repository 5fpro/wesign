module ApplicationHelper
  
  def collection_for_categories
    Category.ordered.map{ |c| [c.name, c.id] }
  end

end
