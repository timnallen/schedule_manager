require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule create endpoint' do
    it 'creates a schedule' do
      post "/api/v1/schedules", params: {
        name: "My Schedule"
      }

      expect(response).to be_successful
      expect(response.status).to eq(201)
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id'].to_i).to be_a(Integer)
      expect(schedule['data']['type']).to eq("schedule")
      expect(schedule['data']['attributes']['name']).to eq("My Schedule")
      expect(schedule['data']['attributes']['appointments']).to be_a(Array)
      expect(schedule['data']['attributes']['appointments'].count).to eq(0)
    end

    it 'tells me I need a name without a body with a name' do
      post "/api/v1/schedules"

      expect(response.status).to eq(400)
      message = JSON.parse(response.body)
      expect(message['message']).to eq("You need a name in a request body")
    end
  end
end
