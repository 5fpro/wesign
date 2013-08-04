class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter { add_crumb "Home", admin_root_path }

  def index
  end
  
end