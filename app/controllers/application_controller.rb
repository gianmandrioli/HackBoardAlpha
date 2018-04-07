class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :title, :mobile, :avatar])
  end

  def auto_grow(element) 
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
  end
  
end
