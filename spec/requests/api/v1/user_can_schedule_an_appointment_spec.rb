require 'rails_helper'

describe 'Appointment API' do
  describe 'When I go to an appointment create endpoint' do
    before :each do
      @schedule_1 = create(:schedule)

      @body = {
        start_time: 1,
        end_time: 2
      }
    end

    it 'creates the appointment' do
      post "/api/v1/schedules/#{@schedule_1.id}/appointments", params: @body

      expect(response).to be_successful
      expect(response.status).to eq(201)
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id'].to_i).to be_a(Integer)
      expect(schedule['data']['type']).to eq("appointment")
      expect(schedule['data']['attributes']['schedule_id']).to eq(@schedule_1.id)
      expect(schedule['data']['attributes']['start_time']).to eq(1)
      expect(schedule['data']['attributes']['end_time']).to eq(2)
    end

    it 'shows me a 404 without a valid id' do
      post "/api/v1/schedules/1/appointments", params: @body

      expect(response.status).to eq(404)
    end

    it 'shows me a 404 without a body' do
      post "/api/v1/schedules/#{@schedule_1.id}/appointments"

      expect(response.status).to eq(404)
    end
  end
end
