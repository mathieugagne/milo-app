class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @project, notice: 'Comment was successfully posted.'
    else
      redirect_to @project, alert: @comment.errors.full_messages.join('. ')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end