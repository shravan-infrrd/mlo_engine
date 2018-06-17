FactoryGirl.define do
  factory :mlo_city, class: 'Mlo::City' do
    city_name "MyString"
    zipcode "MyString"
    county_id 1
  end
end
