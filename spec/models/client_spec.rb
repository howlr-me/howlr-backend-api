# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'validations' do
    subject { create(:client) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:webpage) }
    it { is_expected.to validate_presence_of(:number_of_employees) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
