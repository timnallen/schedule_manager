require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule delete endpoint' do
    it 'deletes a schedule' do
      schedule = create(:schedule)

      delete "/api/v1/schedules/#{schedule.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)

      get "/api/v1/schedules/#{schedule.id}"

      expect(response.status).to eq(404)
    end

    it 'shows me a 404 without a valid id' do
      delete "/api/v1/schedules/1"

      expect(response.status).to eq(404)
    end
  end
end
