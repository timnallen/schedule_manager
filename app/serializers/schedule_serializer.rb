class ScheduleSerializer
  include FastJsonapi::ObjectSerializer

  attribute :appointments do |object|
    object.appointments_in_order
  end
end
