class Opening < ActiveRecord::Base
  belongs_to :merchant
  enum status: [:booked, :available, :complete]


end
