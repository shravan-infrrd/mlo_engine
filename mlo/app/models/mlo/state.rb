module Mlo
  class State < ApplicationRecord
    has_many :counties, class_name: 'Mlo::County'
    
  end
end
