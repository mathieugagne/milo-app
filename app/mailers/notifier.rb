class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.notify_users.subject
  #
  def notify_users comment, subject
    @comment = comment
    @subject = subject
    mail to: User.pluck(:email), subject: @subject
  end
end
