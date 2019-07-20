# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, :webpage, :number_of_employees, presence: true
  validates :name, uniqueness: true
end
