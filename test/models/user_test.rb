require 'test_helper'
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = "wfjeff"
  	user.email = "wm.jeffries@gmail.com"
  	user.first_name = "William"
  	user.last_name = "Jeffries"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user can have a correctly formatted profile name" do 
    user = User.new(first_name: 'Adrianne', last_name: 'Jeffries', email: 'ad.jeffries@gmail.com')
    user.password = user.password_confirmation = 'password'

    user.profile_name = 'adriannejeffries_1'
    assert user.valid?
  end
end
