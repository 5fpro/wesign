module ApplicationHelper
  
  def collection_for_categories
    Category.order_by_weight.map{ |c| [c.name, c.id] }
  end

end
