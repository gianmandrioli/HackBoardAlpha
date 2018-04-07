# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  title      :string
#  text       :string
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_group_id  (group_id)
#  index_posts_on_user_id   (user_id)
#

class Post < ApplicationRecord
  
  enum category: [ 'Idea', 'Pregunta', 'Anuncio' ]

  belongs_to :user
  belongs_to :group

  has_many :comments
  has_many :user_post_claps
  has_many :user_post_bookmarks

  acts_as_votable
  
end
