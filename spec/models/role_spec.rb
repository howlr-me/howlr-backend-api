# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'associations' do
    it { is_expected.to have_db_column(:resource_id).of_type(:integer) }
    it { is_expected.to have_db_column(:resource_type).of_type(:string) }

    it { is_expected.to have_many(:users).through(:users_roles) }
    it { is_expected.to have_many(:users_roles).dependent(:destroy) }
  end

  context 'validations' do
    it {
      expect(subject).to validate_inclusion_of(:name)
        .in_array(%w[super_admin admin])
    }
  end
end
