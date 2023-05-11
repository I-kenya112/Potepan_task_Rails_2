class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      resource.update_with_password(params)
    else
      resource.update_without_password(params.except(:current_password))
    end
  end

end