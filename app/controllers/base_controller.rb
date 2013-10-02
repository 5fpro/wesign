class BaseController < ApplicationController
  before_filter :find_categories

  private

  def find_categories
    @categories = Category.ordered
  end
end
