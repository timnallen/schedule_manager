FactoryBot.define do
  factory :appointment do
    schedule
    start_time { 8 }
    end_time { 10 }
  end
end
