# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  report_id  :integer          not null
#
# Indexes
#
#  index_comments_on_report_id  (report_id)
#
class Comment < ApplicationRecord
    validates :content, presence: true
    
    belongs_to :report
end
