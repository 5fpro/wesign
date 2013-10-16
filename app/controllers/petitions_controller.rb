class PetitionsController < BaseController
  before_filter :authenticate_user!, :except => [:index, :show, :dashboard, :sign]
  before_filter :find_petition, :except => [:index, :show, :dashboard, :sign]
  before_filter :find_petition_progress, :only => [:show, :dashboard]

  def index
    @petitions = Petition.search(:q => params[:q]).page(params[:page]).per(12)
    render :layout => "petition_index"
  end

  def show
    @petition = Petition.find(params[:id])
    @comments = @petition.comments
    @comment = @petition.comments.new
    @progress = @petition.progress
    @progress_bar = @petition.progress_until_max
    render :layout => "petition"
  end

  def new
  end

  def create
    if @petition.save
      redirect_to dashboard_petition_path(@petition), :flash => { :success => "已發起連署" }
    else
      flash[:error] = @petition.errors.full_messages
      render :new
    end
  end

  def dashboard
    render :layout => "dashboard"
  end

  def edit
    @form_petition = @petition
  end

  def update
    if @petition.update_attributes params[:petition]
      redirect_to request.referer || root_path, :flash => { :success => "已更新" }
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

  def find_petition_progress
    @petition = Petition.find(params[:id])
    @progress = @petition.progress
    @progress_bar = @petition.progress_until_max
  end
end
