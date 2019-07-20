# frozen_string_literal: true

class Event < ApplicationRecord
  include Commentable

  belongs_to :client
  belongs_to :user

  has_many :events_tags, dependent: :destroy
  has_many :tags, through: :events_tags
end
