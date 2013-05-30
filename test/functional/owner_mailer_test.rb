require 'test_helper'

class OwnerMailerTest < ActionMailer::TestCase
  test "detail_notice" do
    mail = OwnerMailer.detail_notice
    assert_equal "Detail notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
