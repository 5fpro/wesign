class TimelinesController < ApplicationController
  before_filter :find_petition
  before_filter :check_user

  def create
    @timeline = @petition.timelines.new params[:timeline]
    if @timeline.save
      redirect_to petition_path(@petition), :flash => { :success => "Timeline 已新增" }
    else
      redirect_to petition_path(@petition), :flash => { :errpr => @petition.errors.full_messages.join(",") }
    end
  end

  private 

  def check_user
    redirect_to petition_path(@petition), :flash => { :error => "您沒有權限" } unless user_signed_in? && current_user.id == @petition.user_id
  end

  def find_petition
    @petition = Petition.find params[:petition_id]
  end
end
