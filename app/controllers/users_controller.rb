class UsersController < ApplicationController
  layout 'user_layout'
  before_filter :authenticate_user!, :only => [:edit, :update]

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
    @user = User.find(params[:user_id])
    @created_petitions = @user.created_petitions.page(params[:page]).per(5)
    ids = PetitionUser.where(:user_id => @user.id).map(&:petition_id)
    @linked_petitions = Petition.where(:id => ids).page(params[:page]).per(5)
  end

  def linked
    @user = User.find(params[:user_id])
    ids = PetitionUser.where(:user_id => @user.id).map(&:petition_id)
    @linked_petitions = Petition.where(:id => ids)
  end
end
