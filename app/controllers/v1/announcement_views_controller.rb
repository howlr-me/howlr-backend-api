# frozen_string_literal: true

module V1
  class AnnouncementViewsController < ApplicationController
    before_action :find_announcement!

    def index
      json_response(@announcement.views)
    end

    def create
      annc_view = @announcement.views.create!(user: current_user, client: current_user.client)
      json_response(annc_view)
    end

    private

    def find_announcement!
      @announcement = policy_scope(Announcement).find_by!(id: params[:announcement_id])
    end
  end
end
