class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.references :user
      t.timestamps null: false
    end
  end
end
