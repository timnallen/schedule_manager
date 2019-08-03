class Schedule < ApplicationRecord
  has_many :appointments

  def appointments_in_order
    appointments.order(:start_time)
  end
end
