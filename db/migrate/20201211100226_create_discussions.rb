class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.references :user
      t.references :campaign
      t.timestamps null: false
    end
  end
end
