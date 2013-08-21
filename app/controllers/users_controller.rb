class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]

  def edit
    @user = current_user
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
end
