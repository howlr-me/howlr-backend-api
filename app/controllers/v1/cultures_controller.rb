# frozen_string_literal: true

module V1
  class CulturesController < ApplicationController
    def index
      authorize(Culture)
      cultures = policy_scope(Culture)
      json_response(cultures)
    end

    def create
      authorize(Culture)
      params = culture_params.merge(client: current_user.client)
      culture = Culture.create!(params)
      json_response(culture)
    end

    def show
      authorize(Culture)
      culture = policy_scope(Culture).find(params[:id])
      json_response(culture)
    end

    def update
      culture = Culture.update!(culture_params)
      json_response(culture)
    end

    def delete; end

    private

    def culture_params
      params.require(:culture).permit(:name)
    end
  end
end
