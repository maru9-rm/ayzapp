# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports,  dependent: :destroy
  has_many :points, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :follower, through: :follower_relationships, source: :follower

  delegate :grade, to: :profile, allow_nil: true



  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def has_written?(report)
    reports.exists?(id: report.id)
  end

  def has_point?(report)
    points.exists?(report_id: report.id)
  end

  def prepare_profile
    profile || build_profile
  end
  

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

end
