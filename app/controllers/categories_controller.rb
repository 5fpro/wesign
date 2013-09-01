class CategoriesController < ApplicationController

  def index
    @categories = Category.ordered
  end

end
