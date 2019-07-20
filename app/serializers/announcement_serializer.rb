# frozen_string_literal: true

class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :details

  belongs_to :user
end
