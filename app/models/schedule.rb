class Schedule < ApplicationRecord
  has_many :appointments

  validates_presence_of :name

  def appointments_in_order
    appointments.order(:start_time)
  end
end
