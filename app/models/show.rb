class Show < ActiveRecord::Base
  belongs_to :channel

  validates_presence_of :title, :broadcasted_at, :channel_id
end
