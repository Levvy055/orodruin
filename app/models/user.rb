class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email,
            uniqueness: true,
            presence: true, format: { with: /\A[^@]+@[^@]+\z/ }
  validates :nickname,
            uniqueness: true,
            format: { with: /\A[a-z0-9.-_]+\z/i }

  def age(till: Time.zone.today)
    age = till.year - birthday.year
    age -= 1 if birthday.month > till.month ||
                (birthday.month == till.month && birthday.day > till.day)
    age
  end
end

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
