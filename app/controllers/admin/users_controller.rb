class Admin::UsersController < Admin::BaseController
  before_filter :find_user
  before_filter :except => :index do
    add_crumb("所有會員", admin_users_url)
  end

  def index
    @users = User.scoped
    @admin_page_title = "所有會員"
    add_crumb(@admin_page_title, "#")
  end

  def show
    @admin_page_title = "#{@user.name}的資料"
    add_crumb(@admin_page_title, "#")
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = params[:id] ? User.find(params[:id]) : User.new(params[:user])
  end
end
