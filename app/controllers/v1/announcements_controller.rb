# frozen_string_literal: true

module V1
  class AnnouncementsController < ApplicationController
    before_action :find_announcement, only: %i[show update destroy]

    def index
      authorize(Announcement)
      paginate json: announcements
    end

    def show
      authorize(@announcement)
      render json: @announcement
    end

    def create
      authorize(Announcement)
      annc_params = announcemet_params.merge(user: current_user, client: current_user.client)
      announcement = Announcement.new(annc_params)
      if announcement.save
        render json: announcement
      else
        render_unprocessable_entity announcement
      end
    end

    def update
      authorize(@announcement)
      if @announcement.update(announcemet_params)
        render json: @announcement
      else
        render_unprocessable_entity announcement
      end
    end

    def destroy
      authorize(@announcement)
      @announcement.discard
      render json: nil, status: :no_content
    end

    private

    def announcemet_params
      params.require(:announcement).permit(:title, :details, culture_ids: [], tag_ids: [])
    end

    def find_announcement
      @announcement = announcements.by_hashid(params[:id])
      @announcement || render_not_found
    end

    def announcements
      policy_scope(Announcement).includes(:user)
    end
  end
end
