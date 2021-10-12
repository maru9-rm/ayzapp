# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  status     :integer          default("working"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#
# Indexes
#
#  index_tasks_on_profile_id  (profile_id)
#
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
