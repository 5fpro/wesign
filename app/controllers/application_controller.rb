class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_categories

  private

  def find_categories
    @categories = Category.ordered
  end
end
