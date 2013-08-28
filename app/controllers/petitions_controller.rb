class PetitionsController < ApplicationController
  before_filter :find_petition

  def show
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
    @petition = params[:id] ? Petition.find(params[:id]) : Petition.new(params[:petition])
  end
end
