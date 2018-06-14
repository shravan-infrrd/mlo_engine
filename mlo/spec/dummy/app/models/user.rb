class User < ActiveRecord::Base
ICON_DEFAULT_PROFILE = "https://s3-us-west-1.amazonaws.com/roostifystatic/static/misc_icons/default_profile_pic.png"
has_attached_file :photo,
                    styles: { medium: '200x200>', small: '100x100>', thumb: '20x20>' },
                    default_url: ICON_DEFAULT_PROFILE, s3_permissions: 'public-read'

end
