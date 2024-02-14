require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email: "test@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "Name cannot be blank" do 
    @user.name = "   "
    assert_not @user.valid?
  end
  test "email cannot be blank" do
    @user.email = "  "
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  test "email validation of format - valid ids" do
    valid_ids = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_ids.each do |valid_id|
      @user.email = valid_id
      assert @user.valid?, "#{valid_id.inspect} should be valid"
    end
  end
  test "email validation of format - invalid ids" do
    invalid_ids =  %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_ids.each do |invalid_id|
      @user.email = invalid_id
      assert_not @user.valid?, "#{invalid_id.inspect} should be invalid"
    end
  end
  test "uniquie email ids" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
