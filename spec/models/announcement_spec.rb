# frozen_string_literal: true

require 'rails_helper'
require 'models/concerns/commentable'
require 'models/concerns/viewable'

RSpec.describe Announcement, type: :model do
  context 'associations' do
    it_behaves_like 'commentable'
    it_behaves_like 'viewable'
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:client) }
  end
end
