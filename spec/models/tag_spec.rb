# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:client) }
  end
end
