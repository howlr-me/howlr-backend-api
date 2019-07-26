# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Discard::Model
  extend HashId

  def self.by_hashid(hashid)
    find_by(id: hashid_decode(hashid))
  end
end
