class AddCampaignToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :campaign, index: true, foreign_key: true
  end
end
