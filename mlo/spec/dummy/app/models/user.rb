class User < ActiveRecord::Base

  has_many :county_users, class_name: 'Mlo::CountyUser'
  has_many :counties, class_name: 'Mlo::County', through: :county_users, class_name: 'Mlo::CountyUser'



ICON_DEFAULT_PROFILE = "https://s3-us-west-1.amazonaws.com/roostifystatic/static/misc_icons/default_profile_pic.png"
has_attached_file :photo,
                    styles: { medium: '200x200>', small: '100x100>', thumb: '20x20>' },
                    default_url: ICON_DEFAULT_PROFILE, s3_permissions: 'public-read'




  def self.joined_with_account
    joins('LEFT JOIN accounts on accounts.id = users.account_id')
      .select('users.*, accounts.token as account_token,
        accounts.internal_name as account_internal_name,
        accounts.name as accounts_external_name')
  end
end
