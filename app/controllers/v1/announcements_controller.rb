# frozen_string_literal: true

module V1
  class AnnouncementsController < ApplicationController
    before_action :find_announcement!, only: %i[show update destroy]

    def index
      authorize(Announcement)
      json_response(announcements)
    end

    def show
      authorize(@announcement)
      json_response(@announcement)
    end

    def create
      authorize(Announcement)
      annc_params = announcemet_params.merge(user: current_user, client: current_user.client)
      announcement = Announcement.create!(annc_params)
      json_response(announcement)
    end

    def update
      authorize(@announcement)
      @announcement.update!(announcemet_params)
      json_response(@announcement)
    end

    def destroy
      authorize(@announcement)
      @announcement.discard
      json_response(nil, status: :no_content)
    end

    private

    def announcemet_params
      params.require(:announcement).permit(:title, :details)
    end

    def find_announcement!
      @announcement = announcements.find_by!(id: params[:id])
    end

    def announcements
      policy_scope(Announcement)
    end
  end
end
