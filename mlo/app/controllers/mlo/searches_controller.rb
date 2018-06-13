require_dependency "mlo/application_controller"

module Mlo
  class SearchesController < ApplicationController

		def index
			subdomain = request.subdomains(0).first 
      subdomain = subdomain.gsub('-tdbank', '').to_s rescue ""

      user = User.find_by( :subdomain => subdomain ).as_json(:only => [ :first_name, :last_name, :email, :job_title, :bio, :address ] ) rescue {"first_name" => "shravan" }

      render json: user
		end


  end
end
