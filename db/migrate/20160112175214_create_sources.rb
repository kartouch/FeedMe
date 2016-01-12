class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :url
    end
    add_reference :sources, :author, index: true, foreign_key: true
  end
end
