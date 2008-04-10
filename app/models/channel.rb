class Channel < ActiveRecord::Base
  has_many :shows

  validates_presence_of :name
end
