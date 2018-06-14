require_dependency "mlo/application_controller"

module Mlo
  class SearchesController < ApplicationController

		def index
			subdomain = request.subdomains(0).first 
      subdomain = subdomain.gsub('-tdbank', '').to_s rescue ""
      user = User.find_by( :subdomain => subdomain ).as_json(:only => [ :first_name, :last_name, :email, :job_title, :bio, :address, :home_phone, :mobile_phone, :nmls_id ] )
			if user.nil?
        render json: { message: "user not found"}, status: :unprocessable_entity
        return
			end

      render json: user
      return 
		end


  end
end
