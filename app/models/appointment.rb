class Appointment < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :start_time
  validates_presence_of :end_time
end
