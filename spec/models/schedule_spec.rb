require 'rails_helper'

describe Schedule do
  describe 'relationships' do
    it { should have_many :appointments}
  end

  describe 'instance_methods' do
    it 'appointments_in_order' do
      schedule_1 = create(:schedule)
      app1 = create(:appointment, schedule: schedule_1)
      app2 = create(:appointment, schedule: schedule_1, start_time: 2, end_time: 4)
      app3 = create(:appointment, schedule: schedule_1, start_time: 5, end_time: 7)

      expect(schedule_1.appointments_in_order).to eq([app2, app3, app1])
    end
  end
end
