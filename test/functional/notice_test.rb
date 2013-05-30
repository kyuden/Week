require 'test_helper'

class NoticeTest < ActionMailer::TestCase
  test "all_notice" do
    mail = Notice.all_notice
    assert_equal "All notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
