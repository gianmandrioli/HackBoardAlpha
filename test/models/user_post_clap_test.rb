# == Schema Information
#
# Table name: user_post_claps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_post_claps_on_post_id  (post_id)
#  index_user_post_claps_on_user_id  (user_id)
#

require 'test_helper'

class UserPostClapTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
