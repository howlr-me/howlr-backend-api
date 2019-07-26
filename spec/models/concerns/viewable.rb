# frozen_string_literal: true

RSpec.shared_examples 'viewable' do
  it { is_expected.to have_many(:views) }
end
