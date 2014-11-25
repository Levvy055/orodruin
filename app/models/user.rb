# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`email`**                   | `string(255)`      | `default(""), not null`
# **`encrypted_password`**      | `string(255)`      | `default(""), not null`
# **`reset_password_token`**    | `string(255)`      |
# **`reset_password_sent_at`**  | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`sign_in_count`**           | `integer`          | `default("0"), not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`last_sign_in_at`**         | `datetime`         |
# **`current_sign_in_ip`**      | `string(255)`      |
# **`last_sign_in_ip`**         | `string(255)`      |
# **`confirmation_token`**      | `string(255)`      |
# **`confirmed_at`**            | `datetime`         |
# **`confirmation_sent_at`**    | `datetime`         |
# **`created_at`**              | `datetime`         |
# **`updated_at`**              | `datetime`         |
# **`first_name`**              | `string(255)`      |
# **`last_name`**               | `string(255)`      |
# **`nickname`**                | `string(255)`      | `not null`
# **`birthday`**                | `date`             |
#
# ### Indexes
#
# * `index_users_on_confirmation_token` (_unique_):
#     * **`confirmation_token`**
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#

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
         :recoverable, :rememberable, :trackable, :validatable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :participations
  has_many :conventions, through: :participations

  def self.find_by_nickname(nickname)
    where('LOWER(nickname) = ?', nickname.downcase).first
  end

  # :nodoc:
  class Entity < Grape::Entity
    expose :first_name
    expose :last_name
    expose :nickname
    expose :email
  end
end
