# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  grade      :integer
#  nickname   :string
#  objective  :text
#  subscribed :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
    enum grade: { grade1: 1, grade2: 2, grade3: 3 }
    belongs_to :user
    has_one_attached :avatar
end
