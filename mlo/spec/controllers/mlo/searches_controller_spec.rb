require 'rails_helper'

module Mlo
  RSpec.describe SearchesController, type: :controller do

  end



	RSpec.describe "MLO Details", :type => :request do

    it "creates a Widget" do
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/mlo", :headers => headers
 
      expect(response.content_type).to eq("application/json")
#      expect(response).to have_http_status(:created)
    end

	end

end
