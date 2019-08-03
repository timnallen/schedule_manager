class Api::V1::AppointmentsController < ApplicationController
  def show
    appt = Appointment.find_by(id: params[:id])
    appt ? render_appt(appt) : four_oh_four
  end

  def create
    sch = Schedule.find_by(id: params[:schedule_id])
    sch ? schedule_appt(sch) : four_oh_four
  end

  private

  def render_appt(appt, code = 200)
    render json: AppointmentSerializer.new(appt), status: code
  end

  def schedule_appt(sch)
    appt = sch.appointments.new(appt_params)
    appt.save ? render_appt(appt, 201) : four_oh_four
  end

  def appt_params
    params.permit(:start_time, :end_time)
  end
end
