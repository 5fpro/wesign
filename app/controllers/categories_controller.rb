class CategoriesController < ApplicationController

  def index
    @categories = Category.scoped
  end

end
