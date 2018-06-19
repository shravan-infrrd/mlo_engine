require_dependency "mlo/application_controller"

module Mlo
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: %i(index find show_mlo_results referral join branded_signin)


    def index
      @users = find_mlo_results 
    end


    def find_mlo_results
      users = User.with_role(:lender)
      users = users.joined_with_account
      q = "%#{params[:term]}%".upcase
      puts "-----------here q"
      puts q
      users = users.joins('JOIN mappings m on m.user_id = users.id')
                  .joins('JOIN counties c on c.id = m.county_id')
                  .joins('JOIN cities ci on ci.county_id = c.id')
                  .where('upper(first_name) LIKE ? OR ' \
                          'upper(last_name) LIKE ? OR ' \
                          'ci.zipcode = ? OR ' \
                          'upper(ci.city_name) LIKE ? OR ' \
                          'upper(c.county_name) LIKE ? OR ' \
                          "upper(first_name) || ' ' || upper(last_name) || ' ' || ci.zipcode || ' ' || upper(ci.city_name) || ' ' || upper(c.county_name) LIKE ?",
                         q, q, q, q, q, q)
      # users = User.search(params[:assign_search_field], users) if params[:assign_search_field]
      users = users.paginate(page: params[:page], per_page: 5)
      users
    end

    def find
      users = User.all
      users = find_loan(users)
      term = params[:term]
      if(is_number?( term ))
        render json: users.as_json(:only => [:zipcode, :first_name, :last_name, :city_name, :county_name, :state_name])
      else
        render json: users.as_json(:only => [:first_name, :last_name, :city_name, :county_name, :state_name])
      end
    end 


  end
end
