# frozen_string_literal: true

class EventsTag < ApplicationRecord
  belongs_to :event
  belongs_to :tag
end
