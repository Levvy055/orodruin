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

# Internal: OAuth service provider
#
# This class SHOULD NOT be used directly. If you want to add new provider
# you should subclass this model.
class Auth::Provider < ActiveRecord::Base
  validates :user,  presence: true
  validates :uid,   presence: true
  validates :type,  presence: true

  belongs_to :user, autosave: true

  def self.authorize(auth)
    where(uid: auth.uid).first_or_create do |provider|
      provider.create_user_from(auth)
    end
  end

  protected

  def create_user_from(_)
    fail 'You need to override this method'
  end
end
