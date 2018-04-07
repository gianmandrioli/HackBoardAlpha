# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord

    has_many :groups_users
    has_many :users, through: :groups_users
    has_many :posts
end
