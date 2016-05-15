require 'test_helper'

class InstagramApiControllerTest < ActionController::TestCase
  
  test "parametros correctos" do 
  	post :imageGet , tags:'tennis' , access_token:'2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  	assert_response 400
  end

  test "parametros incorrectos" do
  	post :imageGet
  	assert_response 400
  end

  test "mal access_key" do
  	post :imageGet, tags:'tennis' , access_token:'malAccessKey'
  	assert_response 400
  end



end
