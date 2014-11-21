# ## Schema Information
#
# Table name: `auth_providers`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`user_id`**     | `integer`          |
# **`type`**        | `string(255)`      |
# **`created_at`**  | `datetime`         |
# **`updated_at`**  | `datetime`         |
# **`uid`**         | `string(255)`      |
#
# ### Indexes
#
# * `index_auth_providers_on_type`:
#     * **`type`**
# * `index_auth_providers_on_user_id`:
#     * **`user_id`**
#

# Public: Provider for Facebook OAuth
class Auth::Provider::Facebook < Auth::Provider
  def create_user_from(auth)
    create_user(email: auth.info.email,
                first_name: auth.info.first_name,
                last_name: auth.info.last_name,
                nickname: auth.info.nickname,
                password: Devise.friendly_token[0, 20],
                email: auth.info.email)
  end
end
