class AddCategoryToFeeds < ActiveRecord::Migration
  def change
    add_reference :feeds, :category, index: true, foreign_key: true
  end
end
