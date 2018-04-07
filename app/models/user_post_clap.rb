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

class UserPostClap < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
