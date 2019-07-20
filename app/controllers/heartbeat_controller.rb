# frozen_string_literal: true

class HeartbeatController < ApplicationController
  # skip_after_action :verify_authorized

  def index
    render json: { status: :ok, timestamp: Time.now.utc }
  end
end
