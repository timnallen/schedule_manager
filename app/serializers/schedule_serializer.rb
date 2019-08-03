class ScheduleSerializer
  include FastJsonapi::ObjectSerializer

  attribute :appointments do |object|
    object.appointments
  end
end
