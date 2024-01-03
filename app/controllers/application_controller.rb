class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: -> (error) { handlePunditError(error) }

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:first_name, :last_name]
      )
    end

    def handlePunditError(error)
      render json: { error: error }, status: :unauthorized
    end
end
