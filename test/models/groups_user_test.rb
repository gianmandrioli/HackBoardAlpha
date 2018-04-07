# == Schema Information
#
# Table name: groups_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_users_on_group_id  (group_id)
#  index_groups_users_on_user_id   (user_id)
#

require 'test_helper'

class GroupsUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
