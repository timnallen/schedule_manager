class Api::V1::AppointmentsController < ApplicationController
  def show
    appt = Appointment.find_by(id: params[:id])
    appt ? render_appt(appt) : four_oh_four
  end

  def create
    sch = Schedule.find_by(id: params[:schedule_id])
    sch ? test_validity(sch) : four_oh_four
  end

  def destroy
    appt = Appointment.find_by(id: params[:id], schedule_id: params[:schedule_id])
    appt ? delete_appt(appt) : four_oh_four
  end

  private

  def delete_appt(appt)
    appt.destroy
    render status: 204
  end

  def render_appt(appt, code = 200)
    render json: AppointmentSerializer.new(appt), status: code
  end

  def test_validity(sch)
    appt = sch.appointments.new(appt_params)
    appt.validity_test[:valid] ? schedule_appt(appt) : render_invalid_message(appt.validity_test[:message])
  end

  def render_invalid_message(message)
    render json: {message: message}, status: 400
  end

  def schedule_appt(appt)
    appt.save ? render_appt(appt, 201) : four_oh_four
  end

  def appt_params
    params.permit(:start_time, :end_time)
  end
end
