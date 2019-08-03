require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule show endpoint' do
    it 'shows me the schedule' do
      id = create(:schedule).id.to_s

      get "/api/v1/schedules/#{id}"

      expect(response).to be_successful
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id']).to eq(id)
      expect(schedule['data']['type']).to eq("schedule")
      expect(schedule['data']['attributes']).to eq({"appointments": []})
    end
  end
end
