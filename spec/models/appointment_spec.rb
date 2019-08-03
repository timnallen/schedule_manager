require 'rails_helper'

describe Appointment do
  describe 'validations' do
    it { should validate_presence_of :start_time}
    it { should validate_presence_of :end_time}
  end

  describe 'relationships' do
    it { should belong_to :schedule}
  end
end
