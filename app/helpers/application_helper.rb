module ApplicationHelper
  
  def collection_for_categories
    Category.all.map{ |c| [c.name, c.id] }
  end

end
