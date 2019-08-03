require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule show endpoint' do
    it 'shows me the schedule' do
      schedule_1 = create(:schedule)
      app = create(:appointment, schedule: schedule_1)

      get "/api/v1/schedules/#{schedule_1.id}"

      expect(response).to be_successful
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id']).to eq(schedule_1.id.to_s)
      expect(schedule['data']['type']).to eq("schedule")
      expect(schedule['data']['attributes']['appointments'].count).to eq(1)
      expect(schedule['data']['attributes']['appointments'][0]['id']).to eq(app.id)
    end
  end
end
