class AddColumnToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :isactive, :boolean, default: true
  end
end
