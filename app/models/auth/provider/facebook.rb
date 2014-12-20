# Public: Provider for Facebook OAuth
class Auth::Provider::Facebook < Auth::Provider
  def create_user_from(auth)
    user_info = auth.info

    create_user(email: user_info.email,
                first_name: user_info.first_name,
                last_name: user_info.last_name,
                nickname: user_info.nickname,
                password: Devise.friendly_token[0, 20],
                email: user_info.email)
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
