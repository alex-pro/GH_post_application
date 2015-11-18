class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back, notice: 'Comment has created'
    else
      redirect_to :back, alert: 'Comment hasn\'t created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
