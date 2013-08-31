require 'spec_helper'

describe CategoriesController do
  it "#index" do
    category = FactoryGirl.create :category
    get '/categories'
    response.should be_success
    response.body.should include(category.name)
  end
end
