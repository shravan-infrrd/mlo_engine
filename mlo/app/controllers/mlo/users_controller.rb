require_dependency "mlo/application_controller"

module Mlo
  class UsersController < ApplicationController


    def index
      @users = User.all
    end


    def search
      # binding.pry
      @users = User
#      @users = @users.joined_with_account
      @users = find_officer_loan(@users)
      render :index
#    Rails.logger.warn "===>#{@users.inspect}"
#    render json: @users.as_json
    end
 
    def find_officer_loan(users)
      q = "%#{params[:term]}%".upcase
      puts "-----------here q"
      puts q
      users = users.joins('JOIN mlo_county_users m on m.user_id = users.id')
                   .joins('JOIN mlo_counties c on c.id = m.county_id')
                   .joins('JOIN mlo_cities ci on ci.county_id = c.id')
                   .where('upper(first_name) LIKE ? OR ' \
                          'upper(last_name) LIKE ? OR ' \
                          'ci.zipcode = ? OR ' \
                          'upper(ci.city_name) LIKE ? OR ' \
                          'upper(c.county_name) LIKE ? OR ' \
                          "upper(first_name) || ' ' || upper(last_name) || ' ' || ci.zipcode || ' ' || upper(ci.city_name) || ' ' || upper(c.county_name) LIKE ?",
                           q, q, q, q, q, q)
      # users = User.search(params[:assign_search_field], users) if params[:assign_search_field]
      #users = users.with_role(:lender).paginate(page: params[:page], per_page: 5)
      users.load
      users
    end


  end
end
