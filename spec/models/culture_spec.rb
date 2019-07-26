# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Culture, type: :model do
  context 'association' do
    it { is_expected.to belong_to(:client) }
  end

  context 'validations' do
    subject { create(:culture) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:client_id) }
  end
end
