class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps null: false
      t.references  :parent
    end
  end
end
