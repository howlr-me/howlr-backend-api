# frozen_string_literal: true

class AnnouncementSerializer < ApplicationSerializer
  attributes :id, :title, :details

  belongs_to :user
end
