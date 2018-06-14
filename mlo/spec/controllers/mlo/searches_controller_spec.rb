require 'rails_helper'
require 'pp'

module Mlo

describe SearchesController do

  routes { Mlo::Engine.routes }
  user_params = {"first_name" => "test", "last_name" => "name", "email" => "test@test.com", "bio" => "Description of MLO", "address" => "primary address is wirtten here", "home_phone" => "contact details", "mobile_phone" => "1234567", "nmls_id" =>"1231123", "subdomain" => "tname", "job_title" => "job title of the MLO"}

  expected = {"first_name" => "test", "last_name" => "name", "email" => "test@test.com", "bio" => "Description of MLO", "address" => "primary address is wirtten here", "home_phone" => "contact details", "mobile_phone" => "1234567", "nmls_id" =>"1231123", "job_title" => "job title of the MLO"}

  
	before do
    pp "RSPEC----------------->1"
    User.create!(user_params)
    request.host = "tname-tdbank." + request.host
    get :index
  end

  it 'Check for 200 response code' do
    pp "RSPEC----------------->2"
    json = JSON.parse(response.body)
    expect(response).to be_success
  end

  it "Json Validation for keys" do
    pp "RSPEC----------------->3"
    json = JSON.parse(response.body)
		expect(json).to eql( expected )
	end

end


describe SearchesController do
  routes { Mlo::Engine.routes }
	before do
    pp "RSPEC----------------->1"
    get :index
  end

  it 'Check for 422 response code' do
    pp "RSPEC----------------->2"
    json = JSON.parse(response.body)
    expect(response).to have_http_status(422)
  end
  
end




end
