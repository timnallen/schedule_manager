class Appointment < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :start_time
  validates_presence_of :end_time

  def validity_test
    nil_values? ? invalid_input : check_time
  end

  private

  def check_time
    invalid_time? ? invalid_time : check_overlap
  end

  def check_overlap
    ranges = find_ranges
    conflicts = find_conflicts(ranges)
    conflicts.length > 0 ? invalid_overlap : valid
  end

  def find_ranges
    schedule.appointments_in_order.pluck(:start_time, :end_time).map do |times|
      times[0]..times[1]
    end
  end

  def find_conflicts(ranges)
    ranges.find_all do |range|
      range.overlaps?(start_time..end_time)
    end
  end

  def invalid_input
    {valid: false, message: "Start and end time must be given"}
  end

  def invalid_time
    {valid: false, message: "End time must be after start time"}
  end

  def invalid_overlap
    {valid: false, message: "You cannot schedule an appointment during a previously scheduled appointment"}
  end

  def valid
    {valid: true}
  end

  def invalid_time?
    start_time >= end_time
  end

  def nil_values?
    !start_time || !end_time
  end
end
