# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string           indexed
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string           indexed
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  nickname               :string           not null
#  birthday               :date
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

Fabricator(:user) do
  first_name { Faker::Name.first_name }
  nickname { sequence(:nickname) { |n| "BlackMothafuckaNigga#{n}" } }
  last_name { Faker::Name.last_name }

  email { Faker::Internet.email }

  password 'test-password'
end
