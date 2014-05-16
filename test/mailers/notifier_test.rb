require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "notify_users" do
    mail = Notifier.notify_users
    assert_equal "Notify users", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
