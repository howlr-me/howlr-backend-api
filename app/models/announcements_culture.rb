# frozen_string_literal: true

class AnnouncementsCulture < ApplicationRecord
  belongs_to :culture
  belongs_to :announcement
end
