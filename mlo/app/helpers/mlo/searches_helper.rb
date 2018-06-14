module Mlo
  module SearchesHelper
    def mlo_details_params
      return [:id, :first_name, :last_name, :email, :job_title, :bio, :address, :home_phone, :mobile_phone, :nmls_id]
    end
  end
end
