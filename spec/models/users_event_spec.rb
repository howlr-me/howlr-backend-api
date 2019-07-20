# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersEvent, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:event) }
  end
end
