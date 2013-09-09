module ApplicationHelper
  
  def collection_for_categories
    Category.ordered.map{ |c| [c.name, c.id] }
  end

  def signin_before_petition
    if user_signed_in?
      link_to "發起連署", "#petition-start-up", :data => { :toggle => "modal" }
    else
      link_to "登入以發起連署", "#sign-up", :data => { :toggle => "modal" }
    end
  end

end
