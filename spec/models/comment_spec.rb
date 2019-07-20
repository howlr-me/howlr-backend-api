# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { is_expected.to have_db_column(:commentable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:commentable_type).of_type(:string) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:client) }
    it { is_expected.to belong_to(:commentable) }
  end
end
