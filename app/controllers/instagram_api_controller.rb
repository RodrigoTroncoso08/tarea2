class InstagramApiController < ApplicationController

skip_before_filter  :verify_authenticity_token
require 'httparty'

	def imageGet
		tag = params.require(:tag)
		token = params.require(:token)
		#query = {"access_token" => token , "count"=>"20"}
		#response = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"/media/recent",:query=>query)
		response1 = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"/media/recent?access_token="+token).parsed_response
		response2 = HTTParty.get("https://api.instagram.com/v1/tags/"+tag+"?access_token="+token)
		#response =  { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
		posts= []
		response1['data'].each do |child|
			posts<<{
				:tags =>child['tags'],
				:username =>child['user']['username'],
				:likes => child['likes'],
				:url => child['images']['standard_resolution'],
				:caption => child['caption']['text']
			}
		end
		render :json => posts
	end
end
	