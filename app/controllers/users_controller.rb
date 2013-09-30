class UsersController < ApplicationController
  layout 'user_layout'
  before_filter :authenticate_user!, :only => [:edit, :update]
  before_filter :find_petitions, :only => [:created, :linked]

  def index
  end

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

  def created
  end

  def linked
  end

  private

  def find_petitions
    @user = User.find(params[:user_id])
    @created_petitions = @user.created_petitions.page(params[:page]).per(5)
    @linked_petitions = PetitionUser.linked_petitions(@user).page(params[:page]).per(5)
  end
end
