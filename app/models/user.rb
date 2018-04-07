# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  title                  :integer
#  mobile                 :string
#  password               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :mobile, format: { with: /\d{4}-\d{3}-\d{4}/, message: " invalido" }
    enum title: [ 'Estudiante', 'Egresado', 'Mentor' ]

    has_many :groups_users
    has_many :groups, through: :groups_users
    has_many :posts
    has_many :comments
    has_many :user_post_claps
    has_many :user_post_bookmarks
    has_many :user_comment_claps
    after_create :assign_group

     # existing code

     def self.search(search)
      wildcard_search = "%#{search}%"
    
      where("name LIKE ?", wildcard_search)
    end
  
    def self.search_by_user(search)
      users = self.search(search)
      users.select do |user|
        user == user
      end
    end

    acts_as_voter

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  private

  def assign_group
    GroupsUser.create(user_id: self.id, group_id: 1)
  end

end




 
