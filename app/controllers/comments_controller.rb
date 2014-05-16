class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      subject = "#{current_user.email} commented about Project: #{@project.title}"
      Notifier.notify_users(@comment, subject).deliver
      respond_to do |format|
        @message = 'Comment was successfully posted.'
        format.html { redirect_to @project, notice: @message }
        format.js { @message_type = 'notice' }
      end
    else
      respond_to do |format|
        @message = @comment.errors.full_messages.join('. ')
        format.html { redirect_to @project, alert: @message }
        format.js { @message_type = 'alert' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end