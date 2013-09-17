class PetitionsController < ApplicationController
  layout 'petition_layout'
  before_filter :authenticate_user!, :except => [:show, :petition_user]
  before_filter :find_petition, :except => [:show, :petition_user]

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
  end

  def update
    if @petition.update_attributes params[:petition]
      redirect_to root_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @petition.errors.full_messages
      render :edit
    end
  end

  def petition_user
    @petition = Petition.find(params[:id])
    @user = current_user
    if request.post?
      PetitionUser.create({:petition => @petition, :user => @user, :comment => params[:comment]})
      redirect_to petition_path(@petition), :flash => { :success => "連署成功" }
    else
      redirect_to petition_path(@petition), :flash => { :error => "連署失敗" }
    end
  end

  private

  def find_petition
    @petition = params[:id] ? current_user.petitions.find(params[:id]) : current_user.petitions.new(params[:petition])
  end
end
