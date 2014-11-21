# ## Schema Information
#
# Table name: `roles`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`name`**           | `string(255)`      |
# **`resource_id`**    | `integer`          |
# **`resource_type`**  | `string(255)`      |
# **`created_at`**     | `datetime`         |
# **`updated_at`**     | `datetime`         |
#
# ### Indexes
#
# * `index_roles_on_name`:
#     * **`name`**
# * `index_roles_on_name_and_resource_type_and_resource_id`:
#     * **`name`**
#     * **`resource_type`**
#     * **`resource_id`**
#

# Internal: Participant role in convention
#
# Available roles:
#
# - admin
# - writer
# - volunteer
# - moderator
# - organisator
class Role < ActiveRecord::Base
  # rubocop:disable HasAndBelongsToMany
  has_and_belongs_to_many :participants, join_table: :participants_roles
  belongs_to :resource, polymorphic: true

  scopify
end
