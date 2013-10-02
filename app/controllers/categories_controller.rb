class CategoriesController < BaseController

  def index
    @categories = Category.ordered
  end

end
