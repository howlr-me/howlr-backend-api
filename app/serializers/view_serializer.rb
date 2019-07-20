# frozen_string_literal: true

class ViewSerializer < ActiveModel::Serializer
  attributes :id, :viewable_id, :viewable_type
  belongs_to :user
end
