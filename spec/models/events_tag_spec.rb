# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsTag, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:tag) }
  end
end
