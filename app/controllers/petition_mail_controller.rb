class PetitionMailController < ApplicationController

  def create
    @petition_mail = PetitionMail.new params[:petition_mail]
    @petition_mail.petition = current_user.created_petitions.find(params[:petition_id])
    if @petition_mail.save
      redirect_to dashboard_petition_path(@petition_mail.petition), :flash => { :success => "稍後將會把信件送出" }
    else
      flash[:error] = @petition_mail.errors.full_messages
      render :new
    end
  end

end
