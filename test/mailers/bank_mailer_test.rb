require 'test_helper'

class BankMailerTest < ActionMailer::TestCase
  test "sme_registration" do
    mail = BankMailer.sme_registration
    assert_equal "Sme registration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
