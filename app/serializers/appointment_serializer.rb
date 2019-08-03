class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :schedule_id, :start_time, :end_time
end
