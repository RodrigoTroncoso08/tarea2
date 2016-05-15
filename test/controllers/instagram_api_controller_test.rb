require 'test_helper'

class InstagramApiControllerTest < ActionController::TestCase
  

  test "parametros incorrectos" do
  	post :imageGet
  	assert_response 400
  end

  test "mal access_key" do
  	post :imageGet, tag: 'tennis' , access_token: 'malAccessKey'
  	assert_response 500
  end



end
