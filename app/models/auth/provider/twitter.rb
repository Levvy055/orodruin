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

# Public: Provider for Twitter OAuth
class Auth::Provider::Twitter < Auth::Provider
end
