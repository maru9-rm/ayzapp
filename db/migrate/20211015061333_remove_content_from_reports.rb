class RemoveContentFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :content, :text
  end
end