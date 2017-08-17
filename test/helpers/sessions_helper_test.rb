require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @user = users(:michael)
    remember(@user)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end