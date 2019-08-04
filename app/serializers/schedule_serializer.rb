class ScheduleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :appointments do |object|
    object.appointments_in_order
  end
end
