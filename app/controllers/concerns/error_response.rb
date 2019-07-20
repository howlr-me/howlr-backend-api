# frozen_string_literal: true

module ErrorResponse
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized
    def render_unprocessable_entity(exception)
      json_response(
        {
          message: 'Validation Failed',
          errors: ValidationErrorsSerializer.new(exception.record).serialize
        }, status: :unprocessable_entity
      )
    end

    def render_not_found
      json_response({ message: 'Not found' }, status: :not_found)
    end

    def render_unauthorized
      json_response({ message: 'Not Authorized' }, status: :unauthorized )
    end
  end
end
