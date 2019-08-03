require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule show endpoint' do
    it 'shows me the schedule' do
      schedule_1 = create(:schedule)
      app1 = create(:appointment, schedule: schedule_1)
      app2 = create(:appointment, schedule: schedule_1, start_time: 2, end_time: 4)
      app3 = create(:appointment, schedule: schedule_1, start_time: 5, end_time: 7)

      get "/api/v1/schedules/#{schedule_1.id}"

      expect(response).to be_successful
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id']).to eq(schedule_1.id.to_s)
      expect(schedule['data']['type']).to eq("schedule")
      expect(schedule['data']['attributes']['appointments'][0]['id']).to eq(app2.id)
      expect(schedule['data']['attributes']['appointments'][1]['id']).to eq(app3.id)
      expect(schedule['data']['attributes']['appointments'][2]['id']).to eq(app1.id)
    end
  end
end
