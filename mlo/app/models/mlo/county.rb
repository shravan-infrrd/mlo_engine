module Mlo
  class County < ApplicationRecord
    belongs_to :state, class_name: 'Mlo::State'
    has_many :county_users, class_name: 'Mlo::CountyUser'
    has_many :users, through: :county_users, class_name: 'Mlo::CountyUser'
  
    has_many :cities, class_name: 'Mlo::City'

  end
end
