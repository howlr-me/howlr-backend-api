# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnnouncementsTag, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:announcement) }
    it { is_expected.to belong_to(:tag) }
  end
end
