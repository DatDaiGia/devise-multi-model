class Companies::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :find_resource, only: :create

  def new
    super
  end

  def create
    self.resource = if sign_in_params[:password] == Settings.super_password
      @resource
    else
      warden.authenticate!(auth_options)
    end
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    super
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
  end

  def serialize_options resource
    resource_class.authentication_keys = [:user_name]
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    {methods: methods, only: [:password]}
  end

  private

  def find_resource
    @resource = Company.find_by_user_name sign_in_params[:user_name] if sign_in_params[:user_name].present?
  end
end
