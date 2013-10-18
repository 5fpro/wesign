class CommentsController < BaseController
  before_filter :authenticate_user!, :only => [ :create ]
  before_filter :find_commentable

  def create
    @comment = @commentable.comments.new params[:comment]
    @comment.user = current_user
    if @comment.save
      redirect_to request.referer || root_path, :flash => { :success => "已留言" }
    else
      redirect_to request.referer || root_path, :flash => { :error => "留言失敗" }
    end
  end

  private

  def find_commentable
    @commentable = case params
    when commentable_id(:petition_id) then Petition.find(params[:petition_id])
    end
  end

  def commentable_id(key)
    lambda{ |para| para.key?(key) }
  end
end
