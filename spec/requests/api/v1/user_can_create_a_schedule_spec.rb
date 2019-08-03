require 'rails_helper'

describe 'Schedule API' do
  describe 'When I go to a schedule create endpoint' do
    it 'creates a schedule' do
      post "/api/v1/schedules"

      expect(response).to be_successful
      expect(response.status).to eq(201)
      schedule = JSON.parse(response.body)
      expect(schedule['data']['id']).to be_a(Integer)
      expect(schedule['data']['type']).to eq("schedule")
      expect(schedule['data']['attributes']['appointments']).to be_a(Array)
      expect(schedule['data']['attributes']['appointments'].count).to eq(0)
    end
  end
end
