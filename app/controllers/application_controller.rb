class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise: Antes de qualquer ação, verifica se o usuário está autenticado.
  before_action :authenticate_user!

  # Definição para adicionar mais atributos ao objeto User que está sendo gerenciado pelo Devise.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Definição de quais campos serão aceitos nas sessões com devise.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:full_name, :location, :bio, :email, :password, :password_confirmation, :current_password]

    devise_parameter_sanitizer.for(:account_update) << [:full_name, :location, :bio, :email, :password, :password_confirmation, :current_password]
  end
end
