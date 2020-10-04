class ApplicationController < ActionController::Base  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  layout :define_layout

  private 

  def define_layout    
    devise_controller? ? 'auth' : 'application'
  end

  def after_sign_in_path_for(resource)
    if current_user.admin? 
      admin_dashs_path     
    else       
      stored_location_for(resource) || super
    end    
  end

  def user_not_authorized
    redirect_to root_path
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def configure_permitted_parameters
    atrr_after = [:name, :document]

    devise_parameter_sanitizer.permit(:sign_up, keys: atrr_after)    
  end
end
