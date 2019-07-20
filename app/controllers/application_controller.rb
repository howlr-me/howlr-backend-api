# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include JsonResponse
  include ErrorResponse
  include Pundit

  # after_action :verify_authorized
end
