class AdminController < ActionController::Base
  before_action :authenticate_user!

  layout :define_layout

  private

  def define_layout
    devise_controller? ? 'auth' : 'admin'
  end
end
