class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :purpose
      t.integer :est_duration
      t.references  :user
      t.timestamps null: false
    end
  end
end
