# == Schema Information
#
# Table name: user_comment_claps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_comment_claps_on_comment_id  (comment_id)
#  index_user_comment_claps_on_user_id     (user_id)
#

class UserCommentClap < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
