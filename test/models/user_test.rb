# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null, indexed
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string           indexed
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string           indexed
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  activation_state                :string
#  activation_token                :string           indexed
#  activation_token_expires_at     :datetime
#  nickname                        :string           not null
#  first_name                      :string
#  last_name                       :string
#  birthday                        :date
#
# Indexes
#
#  index_users_on_activation_token      (activation_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#

require "test_helper"

describe User do
  subject(:user) { Fabricate.build(:user) }

  it 'must be valid' do
    value(user).must_be :valid?
  end

  describe 'age' do
    subject(:user) { Fabricate.build(:user, birthday: Date.new(1993, 3, 16)) }

    it 'calculate valid age' do
      user.age(till: Date.new(2015, 6, 26)).must_equal 22
    end
  end
end
