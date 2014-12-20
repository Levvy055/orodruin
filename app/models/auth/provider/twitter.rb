# Public: Provider for Twitter OAuth
class Auth::Provider::Twitter < Auth::Provider
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
