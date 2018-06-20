require_dependency "mlo/application_controller"

module Mlo
  class ThemesController < ApplicationController

    skip_before_action :authenticate_user!
    before_action :set_account
 
    def index
      style_config_id = @account.try(:style_configuration_id)
      if style_config_id.present?
        styles = StyleConfiguration.find(@account.style_configuration_id).all_styles
        render plain: styles, content_type: 'text/css'
      else
        render plain: '', content_type: 'text/css'
      end
    end
 
    def styleguide
      @component = params[:component]
 
      @components = components.map do |component_path|
        get_component_name(component_path)
      end
    end
 
    private
 
    def set_account
      @account = Account.find_by(token: params[:a])
    end
 
    def components
      Dir["app/views/themes/components/*.haml"].sort_by { |f| File.mtime(f) }.reverse
    end
 
    def get_component_name(path)
      /_(.+)\.html.haml/.match(path)[1]
    end

  end
end
