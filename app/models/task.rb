# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  status     :integer          default("working"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_tasks_on_profile_id  (profile_id)
#
class Task < ApplicationRecord
    enum status: { working: 0, completed: 1, discontinued: 2 }
    belongs_to :profile
end
