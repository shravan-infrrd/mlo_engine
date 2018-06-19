require_dependency "mlo/application_controller"

module Mlo
  class SearchesController < ApplicationController
  include Mlo::SearchesHelper
    

		def index
			subdomain = request.subdomains(0).first 
      subdomain = subdomain.gsub('-tdbank', '').to_s rescue ""
      #user = User.select(mlo_details_params).find_by( :subdomain => subdomain )
      user = User.find_by( :subdomain => subdomain )
			if user.nil?
        render json: { message: "user not found"}, status: :unprocessable_entity
        return
			end
      mlo_data = user.as_json(only: mlo_details_params )
      mlo_data["url"] = user.photo.url
      @account_id = user.accounts.last.id
      #render json: mlo_data
      #return 
		end


  end
end
