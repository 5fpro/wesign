class Admin::PetitionsController < Admin::BaseController
  before_filter :find_petition
  before_filter :except => :index do
    add_crumb("所有連署", admin_petitions_url)
  end

  def index
    @petitions = Petition.scoped
    @admin_page_title = "所有連署"
    add_crumb(@admin_page_title, "#")
  end

  def edit
    @admin_page_title = "編輯連署 - #{@petition.name}"
    add_crumb(@admin_page_title, "#")
  end

  def update
    flash[:error] = @petition.errors.full_messages
    render :edit
  end

  def destroy
    @petition.destroy
    redirect_to admin_petitions_path, :flash => { :success => "已刪除" }
  end

  private

  def find_petition
    @petition = params[:id] ? Petition.find(params[:id]) : Petition.new(params[:petition])
  end
end
