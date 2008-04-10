class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :title, :null => false
      t.string :subtitle
      t.datetime :broadcasted_at, :null => false
      t.references :channel, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
