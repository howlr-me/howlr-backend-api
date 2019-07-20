# frozen_string_literal: true

require 'rails_helper'

describe ApplicationPolicy do
  subject { ApplicationPolicy.new(user, Role) }

  context 'for a visitor' do
    let(:user) { nil }

    it { expect { subject }.to raise_error(Pundit::NotAuthorizedError) }
  end

  context 'for user member' do
    let(:user) { create(:user, :member) }

    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:destroy) }
  end

  describe ApplicationPolicy::Scope do
    subject { ApplicationPolicy::Scope.new(user, Role) }

    context 'for a visitor' do
      let(:user) { nil }

      it { expect { subject }.to raise_error(Pundit::NotAuthorizedError) }
    end

    context 'for user' do
      let(:user) { create(:user) }

      it 'resolves all' do
        expect(subject.resolve.to_a).to match_array(Role.all)
      end
    end
  end
end
