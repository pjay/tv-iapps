class Channel < ActiveRecord::Base
  has_many :shows, :order => 'broadcasted_at'

  validates_presence_of :name
end
