require 'rails_helper'

describe Appointment do
  describe 'validations' do
    it { should validate_presence_of :start_time}
    it { should validate_presence_of :end_time}
  end

  describe 'relationships' do
    it { should belong_to :schedule}
  end

  describe 'instance methods' do
    it 'validity_test' do
      schedule = create(:schedule)
      create(:appointment, schedule: schedule)
      app_2 = Appointment.new(schedule: schedule, start_time: 10, end_time: 11)
      app_3 = Appointment.new(schedule: schedule, start_time: 11, end_time: 11)
      app_4 = Appointment.new(schedule: schedule, start_time: 11, end_time: 12)
      expect(app_2.validity_test).to eq(valid: false, message: "You cannot schedule an appointment during a previously scheduled appointment")
      expect(app_3.validity_test).to eq(valid: false, message: "End time must be after start time")
      expect(app_4.validity_test).to eq(valid: true)
    end
  end
end
