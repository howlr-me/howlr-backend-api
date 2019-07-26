# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  include ErrorResponse

  # after_action :verify_authorized

  def current_user
    User.first
  end

  def pagination_page
    byebug
  end
end
