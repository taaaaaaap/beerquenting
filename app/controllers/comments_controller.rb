class CommentsController < ApplicationController

  def create
    binding.pry
    @comment = Comment.create(text: comment_params[:text], review_id: comment_params[:beerquenting_id], user_id: current_user.id,)
    redirect_to "/beerquenting/#{@comment.review_id}"
  end

  private
  def comment_params
    params.permit(:text, :beerquenting_id)
  end
end
