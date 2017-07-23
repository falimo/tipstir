class CommentsController < ApplicationController

before_action :authenticate_user!

  def create
    @tip = Tip.find(params[:tip_id])
    @tip.comments.create(comment_params.merge(user: current_user))
    redirect_to tip_path(@tip)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end




end
