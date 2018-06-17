module Mlo
  class CountyUser < ApplicationRecord
    belongs_to :user, class_name: 'User'
    belongs_to :county, class_name: 'Mlo::County'
  end
end
