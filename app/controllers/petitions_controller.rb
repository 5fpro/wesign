class PetitionsController < ApplicationController
  layout 'petition_layout', :except => [:index]
  before_filter :authenticate_user!, :except => [:index, :show, :sign]
  before_filter :find_petition, :except => [:index, :show, :sign]

  def index
    @petitions = Petition.page(params[:page]).per(12)
    render :layout => "petition_index_layout"
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def new
  end

  def create
    if @petition.save
      respond_to do |f|
        f.html { redirect_to root_path, :flash => { :success => "已發起連署" } }
        f.js { render }
      end
    else
      respond_to do |f|
        f.html { 
          flash[:error] = @petition.errors.full_messages
          render :new
        }
        f.js { render }
      end
    end
  end


  def edit
    @form_petition = @petition
  end

  def update
    if @petition.update_attributes params[:petition]
      redirect_to root_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @petition.errors.full_messages
      render :edit
    end
  end

  def sign
    @petition = Petition.find(params[:id])
    @petition_user = @petition.petition_users.new(params[:petition_user])
    @petition_user.user = current_user
    @petition_user.comment = params[:comment]
    if @petition_user.save
      redirect_to petition_path(@petition), :flash => { :success => "連署成功" }
    else
      flash[:error] = @petition_user.errors.full_messages
      redirect_to petition_path(@petition)
    end
  end

  private

  def find_petition
    @petition = params[:id] ? current_user.created_petitions.find(params[:id]) : current_user.created_petitions.new(params[:petition])
  end
end
