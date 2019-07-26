# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/commentable'

RSpec.describe Event, type: :model do
  context 'associations' do
    it_behaves_like 'commentable'
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:client) }
  end
end
