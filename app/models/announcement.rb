# frozen_string_literal: true

class Announcement < ApplicationRecord
  include Commentable
  include Viewable

  belongs_to :user
  belongs_to :client

  has_many :announcements_tags, dependent: :destroy
  has_many :tags, through: :announcements_tags

  has_many :announcements_cultures, dependent: :destroy
  has_many :cultures, through: :announcements_cultures

  validates :title, :details, presence: true
end
