class Culture < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
  validates :name, uniqueness: { scope: :client_id }
end
