class InstagramApiController < ApplicationController

skip_before_filter  :verify_authenticity_token
require 'httparty'

	def imageGet
		respond_to do |format|
			tag = params.require(:tag)
			token = params.require(:token)
			#query = {"access_token" => token , "count"=>"20"}
			#response = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"/media/recent",:query=>query)
			response1 = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"/media/recent?access_token="+token).parsed_response
			response2 = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"?access_token="+token)
			#response =  { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
			format.json {render :json => response1}
			end
	end
end
	