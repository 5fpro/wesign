class PetitionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_petition, :except => [:show]

  def show
    @petition = Petition.find(params[:id])
  end

  def new
  end

  def create
    if @petition.save
      redirect_to root_path, :flash => { :success => "已新增" }
    else
      flash[:error] = @petition.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @petition.update_attributes params[:petition]
      redirect_to root_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @petition.errors.full_messages
      render :edit
    end
  end

  private

  def find_petition
    @petition = params[:id] ? current_user.petitions.find(params[:id]) : current_user.petitions.new(params[:petition])
  end
end
