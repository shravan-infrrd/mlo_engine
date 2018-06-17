class County < ApplicationRecord
  belongs_to :state
  has_many :cities

  def self.check(county)
    return County.exists?(county_name: county)
  end
end
