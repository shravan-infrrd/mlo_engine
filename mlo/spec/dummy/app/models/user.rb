class User < ActiveRecord::Base

  has_many :county_users, class_name: 'Mlo::CountyUser'
  has_many :counties, class_name: 'Mlo::County', through: :county_users, class_name: 'Mlo::CountyUser'


  def full_name
    first_name.blank? ? '' : [first_name, last_name].join(' ')
  end
  alias name full_name

ICON_DEFAULT_PROFILE = "https://s3-us-west-1.amazonaws.com/roostifystatic/static/misc_icons/default_profile_pic.png"
has_attached_file :photo,
                    styles: { medium: '200x200>', small: '100x100>', thumb: '20x20>' },
                    default_url: ICON_DEFAULT_PROFILE, s3_permissions: 'public-read'



  scope :joined_with_city_county_state, (lambda do
    joins('JOIN mappings m on m.user_id = users.id')
        .joins('JOIN counties c on c.id = m.county_id')
        .joins('JOIN cities ci on ci.county_id = c.id')
        .joins('JOIN states s on s.id = c.state_id')
        .select('ci.city_name, c.county_name, s.state_name')
  end)


  def address
    address = User.joined_with_city_county_state.where(id: id).pluck('ci.city_name, c.county_name, s.state_name').first
    return address
    address.to_sentence(two_words_connector: ', ', words_connector: ', ', last_word_connector: ',')
  end

  def self.joined_with_account
    joins('LEFT JOIN accounts on accounts.id = users.account_id')
      .select('users.*, accounts.token as account_token,
        accounts.internal_name as account_internal_name,
        accounts.name as accounts_external_name')
  end
end
