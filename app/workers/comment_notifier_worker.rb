class CommentNotifierWorker
  include SuckerPunch::Job

  def perform(comment_id, subject)
    comment = Comment.find(comment_id)
    Notifier.notify_users(comment, subject).deliver
  end

end