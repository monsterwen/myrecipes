require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get home" do
    #test we are getting response that go to homepage successfully
    #step one: goint to home page
    #page controller, home action
    get pages_home_url
    #when get the url
    assert_response :success
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
end
