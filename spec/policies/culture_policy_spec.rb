# frozen_string_literal: true

require 'rails_helper'

describe CulturePolicy do
  describe CulturePolicy::Scope do
    subject { CulturePolicy::Scope.new(user, Culture) }

    context 'for a visitor' do
      let(:user) { nil }
      it { expect { subject }.to raise_error(Pundit::NotAuthorizedError) }
    end

    context 'for user member' do
      let(:user) { create(:user, :member) }
      let!(:cultures) { create_list(:culture, 12, client: user.client) }

      it 'resolves all' do
        expect(subject.resolve.to_a).to match_array(cultures)
      end
    end
  end
end
