class CommentsController < ApplicationController
  def create
    comment = Comment.new(desc: params[:comment], user_id: current_user.id, recipe_id: params[:recipe])
    if comment.save
      redirect_to :back
    end
  end
end
