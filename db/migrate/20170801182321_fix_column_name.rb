class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :articles, :title, :ProductName
  end
end
