require "test_helper"

class GamesMailerTest < ActionMailer::TestCase
  test "winner" do
    mail = GamesMailer.winner
    assert_equal "Winner", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
