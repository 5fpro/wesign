class Admin::TagsController < Admin::BaseController
  before_filter :find_tag
  before_filter :except => :index do
    add_crumb("所有 tag", admin_tags_url)
  end

  def index
    @tags = Tag.scoped
    @admin_page_title = "所有 tag"
    add_crumb(@admin_page_title, "#")
  end

  def new
    @admin_page_title = "新增 tag"
    add_crumb(@admin_page_title, "#")
  end

  def create
    if @tag.save
      redirect_to admin_tags_path, :flash => { :success => "已新增" }
    else
      flash[:error] = @tag.errors.full_messages
      render :new
    end
  end

  def edit
    @admin_page_title = "編輯 tag - #{@tag.name}"
    add_crumb(@admin_page_title, "#")
  end

  def update
    if @tag.update_attributes params[:tag]
      redirect_to admin_tags_path, :flash => { :success => "已更新" }
    else
      flash[:error] = @tag.errors.full_messages
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, :flash => { :success => "已刪除" }
  end

  private

  def find_tag
    @tag = params[:id] ? Tag.find(params[:id]) : Tag.new(params[:tag])
  end
end