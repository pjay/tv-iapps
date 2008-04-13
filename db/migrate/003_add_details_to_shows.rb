class AddDetailsToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :details, :text
  end

  def self.down
    remove_column :shows, :details
  end
end
