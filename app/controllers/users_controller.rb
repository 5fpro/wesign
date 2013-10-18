class UsersController < BaseController
  before_filter :authenticate_user!, :only => [:edit, :update]
  before_filter :find_petitions, :only => [:show, :created, :linked]

  def index
    render :layout => "user"
  end

  def edit
    @user = current_user
    render :layout => "user"
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to users_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    render :linked, :layout => "user"
  end

  def created
    render :layout => "user"
  end

  def linked
    render :layout => "user"
  end

  private

  def find_petitions
    @user = params[:user_id] ? User.find(params[:user_id]) : User.find(params[:id])
    @created_petitions = @user.created_petitions.page(params[:page]).per(5)
    @linked_petitions = @user.linked_petitions.page(params[:page]).per(5)
  end
end
