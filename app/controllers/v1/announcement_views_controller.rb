# frozen_string_literal: true

module V1
  class AnnouncementViewsController < ApplicationController
    before_action :find_announcement

    def index; end

    def create
      annc_view = @annc.views.find_or_create_by(user: current_user, client: current_user.client)
      if annc_view.save
        render json: annc_view, status: :ok
      else
        render_unprocessable_entity annc_view
      end
    end

    private

    def find_announcement
      @annc = policy_scope(Announcement)
              .find_by(id: params[:announcement_id])
    end
  end
end
