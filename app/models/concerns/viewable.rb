# frozen_string_literal: true

module Viewable
  extend ActiveSupport::Concern

  included do
    has_many :views, dependent: :destroy, as: :viewable
  end
end
