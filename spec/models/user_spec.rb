# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to have_many(:users_cultures) }
    it { is_expected.to have_many(:cultures).through(:users_cultures) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
