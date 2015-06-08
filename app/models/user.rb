# Public: User information
#
# This model store user information and provide simple way to authorize and
# authenticate users.
#
# This model is [rolified](https://github.com/EppO/rolify). Check documentation
# to know how to deal with roles.
#
# Devise modules active:
#
# - database authenticatable
# - registerable
# - omniauthable (Facebook, Google OAuth2)
# - recoverable
# - rememberable
# - trackable
# - validatable
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :participations
  has_many :conventions, through: :participations

  # Public: Find user by nickname case-insensitive
  def self.find_by_nickname(nickname)
    find_by('LOWER(nickname) = ?', nickname.downcase)
  end
end

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
