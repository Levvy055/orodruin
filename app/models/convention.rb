# ## Schema Information
#
# Table name: `conventions`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string(255)`      |
# **`start`**       | `date`             |
# **`finish`**      | `date`             |
# **`created_at`**  | `datetime`         |
# **`updated_at`**  | `datetime`         |
#

class Convention < ActiveRecord::Base
  has_many :participations, dependent: :destroy
end
