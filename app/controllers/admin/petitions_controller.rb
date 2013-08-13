class Admin::PetitionsController < Admin::BaseController
  before_filter :find_category
  before_filter :find_petition
  before_filter :except => :index do
    if params[:category_id]
      add_crumb("所有分類", admin_categories_url)
      add_crumb("#{@category.name}下的所有連署", admin_category_petitions_url(@category))
    else
      add_crumb("所有連署", admin_petitions_url)
    end
  end

  def index
    @petitions = Petition.scoped
    if params[:category_id]
      @admin_page_title = "#{@category.name}下的所有連署"
      add_crumb(@admin_page_title, "#")
    else
      @admin_page_title = "所有連署"
      add_crumb(@admin_page_title, "#")
    end
  end

  def new
    @admin_page_title = "新增連署"
    add_crumb(@admin_page_title, "#")
  end

  def create
    if @petition.save
      if params[:category_id]
        redirect_to admin_category_petitions_path(@category), :flash => { :success => "已新增" }
      else
        redirect_to admin_petitions_path, :flash => { :success => "已新增" }
      end
    else
      flash[:error] = @petition.errors.full_messages
      render :new
    end
  end

  def edit
    @admin_page_title = "編輯連署 - #{@petition.name}"
    add_crumb(@admin_page_title, "#")
  end

  def update
    if @petition.update_attributes params[:petition]
      if params[:category_id]
        redirect_to admin_category_petitions_path(@category), :flash => { :success => "已更新" }
      else
        redirect_to admin_petitions_path, :flash => { :success => "已更新" }
      end
    else
      flash[:error] = @petition.errors.full_messages
      render :edit
    end
  end

  def destroy
    @petition.destroy
    if params[:category_id]
      redirect_to admin_category_petitions_path(@category), :flash => { :success => "已刪除" }
    else
      redirect_to admin_petitions_path, :flash => { :success => "已刪除" }
    end
  end

  private

  def find_category
    @category = Category.find params[:category_id] if params[:category_id]
  end

  def find_petition
    @petition = params[:id] ? Petition.find(params[:id]) : Petition.new(params[:petition])
  end
end
