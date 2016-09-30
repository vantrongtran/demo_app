class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
  	@micropost = Micropost.find(params[:micropost_id])
  	@comment = @micropost.comments.create(comment_params)
  	redirect_to micropost_path(@micropost)
  end
  private
    def comment_params
      params.require(:comment).permit(:user_id,:content)
    end
end
