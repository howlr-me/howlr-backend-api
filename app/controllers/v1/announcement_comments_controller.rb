# frozen_string_literal: true

module V1
  class AnnouncementCommentsController < ApplicationController
    before_action :find_announcement

    def index; end

    def create; end

    def update; end

    def delete; end

    private

    def find_announcement
      @announcement = policy_scope(Announcemet).find_by(id: params[:announcement_id])
    end
  end
end
