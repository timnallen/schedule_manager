class Api::V1::AppointmentsController < ApplicationController
  def show
    appointment = Appointment.find_by(id: params[:id])
    appointment ? render(json: AppointmentSerializer.new(appointment)) : four_oh_four
  end
end
