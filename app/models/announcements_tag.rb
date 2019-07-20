# frozen_string_literal: true

class AnnouncementsTag < ApplicationRecord
  belongs_to :announcement
  belongs_to :tag
end
