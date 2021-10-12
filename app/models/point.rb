# == Schema Information
#
# Table name: points
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  report_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_points_on_report_id  (report_id)
#  index_points_on_user_id    (user_id)
#
class Point < ApplicationRecord
    belongs_to :user
    belongs_to :report
end
