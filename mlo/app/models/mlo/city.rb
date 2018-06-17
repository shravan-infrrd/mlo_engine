module Mlo
  class City < ApplicationRecord
    belongs_to :county, class_name: 'Mlo::County'
  end
end
