# == Schema Information
#
# Table name: auth_providers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uid        :string(255)
#
# Indexes
#
#  index_auth_providers_on_type     (type)
#  index_auth_providers_on_user_id  (user_id)
#

require 'test_helper'

describe Auth::Provider::Vkontakte do
  describe '#authorize' do
    let(:data) do
      TestStruct.new(uid: '123456',
                     extra: { raw_info: { email: 'test@example.com' } },
                     info: { first_name: 'John',
                             last_name: 'Doe',
                             nickname: 'JD',
                             email: 'test@example.com' })
    end

    describe 'given user does not exist' do
      let(:auth) { Auth::Provider::Vkontakte.authorize(data) }
      let(:user) { auth.user }

      before { auth }

      it 'has no errors' do
        user.errors.must_be :empty?
      end

      it 'user is persisted' do
        user.must_be :persisted?
      end

      it 'create new user' do
        User.count.must_equal 1
      end

      it 'user has been filled' do
        user.first_name.must_equal 'John'
        user.last_name.must_equal 'Doe'
        user.nickname.must_equal 'JD'
        user.email.must_equal 'test@example.com'
      end
    end
  end
end
