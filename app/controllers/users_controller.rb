class UsersController < ApplicationController
  before_filter :find_user

  def index
    @users = User.scoped
  end

  def edit
  end

  def update
    if @user.update_attributes params[:user]
      redirect_to users_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def find_user
    @user = params[:id] ? User.find(params[:id]) : User.new(params[:user])
  end
end
