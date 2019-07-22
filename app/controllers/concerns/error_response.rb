# frozen_string_literal: true

module ErrorResponse
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

    def render_not_found
      render json: { message: 'Not Found' }, status: :unauthorized
    end

    def render_unauthorized
      # TODO: Implement logging
      render_not_found
    end

    def render_unprocessable_entity(record)
      render json:
        {
          message: 'Validation Failed',
          errors: ValidationErrorsSerializer.new(record).serialize
        }, status: :unprocessable_entity
    end
  end
end
