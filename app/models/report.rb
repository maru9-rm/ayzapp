# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reports_on_user_id  (user_id)
#
class Report < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :points, dependent: :destroy
    has_one_attached :eyecatch
    has_rich_text :content

    
    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end
    
    def point_count
        points.count
    end
    
end
