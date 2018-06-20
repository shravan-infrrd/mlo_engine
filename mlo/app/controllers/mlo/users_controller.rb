require_dependency "mlo/application_controller"

module Mlo
  class UsersController < ApplicationController
#    skip_before_action :authenticate_user!, only: %i(index find show_mlo_results referral join branded_signin)


    def index
      puts "====1===="
      @users = find_mlo_results
      puts "====3===="
    end


    def find_mlo_results
      puts "====2===="

      users = User #.with_role(:lender)
      users = users.joined_with_account
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
      users = users.paginate(page: params[:page], per_page: 5)
      # Rails.logger.debug "======>#{users.inspect}" #rescue
      return users

    end


    def show_mlo_results
      puts "----*****----here"
      @users = find_mlo_results
      render partial: 'render_mlo'
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

    def find_loan(users)
      q = "%#{params[:term]}%".upcase
      users.joins('JOIN mlo_county_users m on m.user_id = users.id')
          .joins('JOIN mlo_counties c on c.id = m.county_id')
          .joins('JOIN mlo_cities ci on ci.county_id = c.id')
          .joins('JOIN mlo_states s on s.id = c.state_id')
          .select('first_name, last_name, ci.zipcode, ci.city_name, c.county_name, s.state_name')
          .where('upper(first_name) LIKE ? OR ' \
                 'upper(last_name) LIKE ? OR ' \
                 'ci.zipcode = ? OR ' \
                 "upper(first_name) || ' ' || upper(last_name) || ' ' || ci.zipcode LIKE ?",
                 q, q, q, q) + users.joins('JOIN mlo_county_users m on m.user_id = users.id')
                                    .joins('JOIN mlo_counties c on c.id = m.county_id')
                                    .joins('JOIN mlo_cities ci on ci.county_id = c.id')
                                    .joins('JOIN mlo_states s on s.id = c.state_id')
                                    .select('first_name, last_name, ci.zipcode, ci.city_name, c.county_name, s.state_name')
                                    .where('upper(ci.city_name) LIKE ? ' , q) + users.joins('JOIN mlo_county_users m on m.user_id = users.id')
                                                                                     .joins('JOIN mlo_counties c on c.id = m.county_id')
                                                                                     .joins('JOIN mlo_cities ci on ci.county_id = c.id')
                                                                                     .joins('JOIN mlo_states s on s.id = c.state_id')
                                                                                     .select('first_name, last_name, ci.zipcode, ci.city_name, c.county_name, s.state_name')
                                                                                     .where('upper(c.county_name) LIKE ? ' , q) + users.joins('JOIN mlo_county_users m on m.user_id = users.id')
                                                                                                                                         .joins('JOIN mlo_counties c on c.id = m.county_id')
                                                                                                                                         .joins('JOIN mlo_cities ci on ci.county_id = c.id')
                                                                                                                                         .joins('JOIN mlo_states s on s.id = c.state_id')
                                                                                                                                         .select('first_name, last_name, ci.zipcode, ci.city_name, c.county_name, s.state_name')
                                                                                                                                         .where('upper(s.state_name) LIKE ? ' , q)
    end


    def is_number? string
      true if Float(string) rescue false
    end


  end
end
