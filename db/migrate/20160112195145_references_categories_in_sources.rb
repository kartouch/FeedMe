# -*- encoding : utf-8 -*-
class ReferencesCategoriesInSources < ActiveRecord::Migration
  def change
      add_reference :sources, :category, index: true, foreign_key: true
  end
end
