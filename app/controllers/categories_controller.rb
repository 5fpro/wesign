class CategoriesController < BaseController

  def index
    @categories = Category.ordered
    @petitions = Petition.scoped
    @petitions_count = Petition.count
    @petition_signs_count = Petition.sum("signs_count")
    render :layout => "application"
  end

end
