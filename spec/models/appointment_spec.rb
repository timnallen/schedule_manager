require 'rails_helper'

describe Appointment do
  describe 'relationships' do
    it { should belong_to :schedule}
  end
end
