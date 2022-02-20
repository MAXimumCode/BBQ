require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_for_oauth' do
    let(:access_token) do
      double(
        :access_token,
        provider: 'facebook',
        info: double(email: 'mail@mail.ru'),
        extra: double(raw_info: double(id: '10213477015136709'))
      )
    end

    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'mail@mail.ru') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_oauth(access_token)).to eq existing_user
      end
    end

    context 'when user is found by provider + url' do
      let!(:existing_user) do
        create(:user, provider: 'facebook',
               url: 'https://facebook.com/10213477015136709')
      end
      let!(:some_other_uer) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_oauth(access_token)).to eq existing_user
      end
    end
  end
end
