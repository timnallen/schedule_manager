require 'rails_helper'

describe 'Appointment API' do
  describe 'When I go to an appt delete endpoint' do
    before :each do
      @schedule = create(:schedule)
      @appt = create(:appointment, schedule: @schedule)
    end

    it 'deletes an appt' do
      delete "/api/v1/schedules/#{@schedule.id}/appointments/#{@appt.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)

      get "/api/v1/appointments/#{@appt.id}"

      expect(response.status).to eq(404)
    end

    it 'shows me a 404 without a valid schedule id' do
      delete "/api/v1/schedules/1/appointments/#{@appt.id}"

      expect(response.status).to eq(404)
    end
  end
end
