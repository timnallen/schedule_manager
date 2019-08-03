require 'rails_helper'

describe 'Appointment API' do
  describe 'When I go to an appointment show endpoint' do
    it 'shows me the appointment' do
      schedule_1 = create(:schedule)
      app = create(:appointment, schedule: schedule_1)

      get "/api/v1/appointments/#{app.id}"

      expect(response).to be_successful
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id']).to eq(app.id.to_s)
      expect(schedule['data']['type']).to eq("appointment")
      expect(schedule['data']['attributes']['schedule_id']).to eq(schedule_1.id)
      expect(schedule['data']['attributes']['start_time']).to eq(8)
      expect(schedule['data']['attributes']['end_time']).to eq(10)
    end

    it 'shows me a 404 without a valid id' do
      get "/api/v1/appointments/1"

      expect(response.status).to eq(404)
    end
  end
end
