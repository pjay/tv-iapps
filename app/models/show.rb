class Show < ActiveRecord::Base
  belongs_to :channel

  validates_presence_of :title, :channel_id
end
