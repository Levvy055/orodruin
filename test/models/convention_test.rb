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

require 'test_helper'

class ConventionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
