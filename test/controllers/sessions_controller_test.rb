require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    tester = teams(:one)
    post :create, name: tester.name, password: 'secret'
    assert_redirected_to cards_url
    assert_equal tester.id, session[:team_id]
  end

  test "should fail login" do
    tester = teams(:one)
    post :create, name: tester.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to login_url
  end
end
