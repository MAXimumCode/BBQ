require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:event) { create(:event, user: event_creator) }
  let(:event_whit_pin) { create(:event, user: event_creator, pincode: '1234') }
  let(:cookies) { { "events_#{event_whit_pin.id}_pincode" => '1234' } }

  let(:user) { create(:user) }
  let(:event_creator) { create(:user) }

  let(:event_creator_context) { UserContext.new(event_creator, {}) }
  let(:user_context) { UserContext.new(user, cookies) }
  let(:anon_with_cookies) { UserContext.new(nil, cookies) }
  let(:anon_without_cookies) { UserContext.new(nil, {}) }

  context 'user is authenticated and he is the event owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(event_creator_context, event) }
    end
  end

  context 'user is authenticated and he is not the event owner and have cookies' do
    permissions :create? do
      it { is_expected.to permit(user_context, event_whit_pin) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user_context, event_whit_pin) }
    end
  end

  context 'user is not authenticated but have cookies' do
    permissions :show? do
      it { is_expected.to permit(anon_with_cookies, event_whit_pin) }
    end

    permissions :create?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(anon_with_cookies, event_whit_pin) }
    end
  end

  context 'anon doesnt have cookies' do
    permissions :create?, :show?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(anon_without_cookies, event_whit_pin) }
    end
  end
end
