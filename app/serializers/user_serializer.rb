# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :name, :email

  belongs_to :client
end
