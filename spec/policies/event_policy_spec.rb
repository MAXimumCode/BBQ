require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:event) { create(:event, user: user) }

  context 'user is authenticated and he is the event owner' do
    permissions :create?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'user is authenticated and he is not the event owner' do
    permissions :create? do
      it { is_expected.to permit(user, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(other_user, event) }
    end
  end

  context 'user is not authenticated' do
    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end

    permissions :create?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end
end