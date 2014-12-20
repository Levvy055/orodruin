# Public: Provider for Google OAuth2
class Auth::Provider::Google < Auth::Provider
  def create_user_from(auth)
    create_user(first_name: auth.info.first_name,
                last_name: auth.info.last_name,
                email: auth.info.email,
                password: Devise.friendly_token[0, 20],
                nickname: '')
  end
end

# == Schema Information
#
# Table name: auth_providers
#
#  id         :integer          not null, primary key
#  user_id    :integer          indexed
#  type       :string(255)      indexed
#  created_at :datetime
#  updated_at :datetime
#  uid        :string(255)
#
# Indexes
#
#  index_auth_providers_on_type     (type)
#  index_auth_providers_on_user_id  (user_id)
#
