class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :find_basket, if: :current_user?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_gender
  before_action :authenticate_user!
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource)
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def find_basket
    if Basket.find_by(status: "pending", user: current_user).nil?
      @basket = Basket.create(user: current_user)
    else
      @basket = Basket.find_by(status: "pending", user: current_user)
    end
  end

  def current_user?
    current_user.present?
  end

  def set_gender
    session[:type] = params[:genders] if params[:genders]
  end
end
