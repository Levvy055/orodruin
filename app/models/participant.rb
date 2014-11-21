# ## Schema Information
#
# Table name: `participants`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`user_id`**        | `integer`          |
# **`convention_id`**  | `integer`          |
# **`created_at`**     | `datetime`         |
# **`updated_at`**     | `datetime`         |
#
# ### Indexes
#
# * `index_participants_on_convention_id`:
#     * **`convention_id`**
# * `index_participants_on_user_id`:
#     * **`user_id`**
#

class Participant < ActiveRecord::Base
  rolify

  belongs_to :user
  belongs_to :convention

  validates :convention, presence: true
end
