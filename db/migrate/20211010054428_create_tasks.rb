class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :profile, null: false
      t.string :title, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
