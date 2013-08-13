class Admin::TimelinesController < Admin::BaseController
  before_filter :find_petition
  before_filter :find_timeline
  before_filter :except => :index do
    add_crumb("所有連署", admin_petitions_url)
    add_crumb("#{@petition.name}下的所有時間軸", admin_petition_timelines_url(@petition))
  end

  def index
    @timelines = @petition.timelines.order("happened_at DESC")
    add_crumb("所有連署", admin_petitions_url)
    @admin_page_title = "#{@petition.name}下的所有時間軸"
    add_crumb(@admin_page_title, "#")
  end

  def new
    @admin_page_title = "新增時間軸"
    add_crumb(@admin_page_title, "#")
  end

  def create
    if @timeline.save
      redirect_to admin_petition_timelines_path(@petition), :flash => { :success => "已新增" }
    else
      flash[:error] = @timeline.errors.full_messages
      render :new
    end
  end

  def edit
    @admin_page_title = "編輯時間軸 - #{@timeline.title}"
    add_crumb(@admin_page_title, "#")
  end

  def update
    if @timeline.update_attributes params[:timeline]
      redirect_to admin_petition_timelines_path(@petition), :flash => { :success => "已更新" }
    else
      flash[:error] = @timeline.errors.full_messages
      render :edit
    end
  end

  def destroy
    @timeline.destroy
    redirect_to admin_petition_timelines_path(@petition), :flash => { :success => "已刪除" }
  end

  private

  def find_petition
    @petition = Petition.find params[:petition_id]
  end

  def find_timeline
    @timeline = params[:id] ? Timeline.find(params[:id]) : Timeline.new(params[:timeline])
  end
end
