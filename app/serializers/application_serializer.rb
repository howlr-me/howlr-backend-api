# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  include HashId

  def id
    encode_id object.id
  end
end
