require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get people_form_url
    assert_response :success
  end

end
