# frozen_string_literal: true

class ViewSerializer < ApplicationSerializer
  attributes :id

  belongs_to :user
end
