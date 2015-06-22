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
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :nickname, :birthday
end
