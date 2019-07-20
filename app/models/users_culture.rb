# frozen_string_literal: true

class UsersCulture < ApplicationRecord
  belongs_to :user
  belongs_to :culture
end
