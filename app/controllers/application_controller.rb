class ApplicationController < ActionController::Base  
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :define_layout

  private 

  def define_layout    
    devise_controller? ? 'auth' : 'application'
  end

  def after_sign_in_path_for(resource)
    if current_user.admin? 
      admin_dash_index_path      
    else      
      root_path
    end    
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def user_not_authorized
    redirect_to root_path
  end

  def configure_permitted_parameters
    atrr_after = [:name]

    devise_parameter_sanitizer.permit(:sign_up, keys: atrr_after)    
  end
end
