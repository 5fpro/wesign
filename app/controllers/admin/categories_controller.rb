class Admin::CategoriesController < Admin::BaseController  
  before_filter :find_category
  before_filter :except => :index do
    add_crumb("所有連署分類", admin_categories_url)
  end

  def index
    @categories = Category.order("weight DESC")
    @admin_page_title = "所有連署分類"
    add_crumb(@admin_page_title, "#")
  end

  def new
    @admin_page_title = "新增連署分類"
    add_crumb(@admin_page_title, "#")
  end

  def create
    if @category.save
      redirect_to admin_categories_path, :flash => { :success => "已新增" }
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end

  def edit
    @admin_page_title = "編輯連署分類 - #{@category.name}"
    add_crumb(@admin_page_title, "#")
  end

  def update
    if @category.update_attributes params[:category]
      redirect_to admin_categories_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, :flash => { :success => "已刪除" }
  end

  private

  def find_category
    @category = params[:id] ? Category.find(params[:id]) : Category.new(params[:category])
  end
end
