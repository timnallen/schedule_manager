class Api::V1::SchedulesController < ApplicationController
  def show
    schedule = Schedule.find_by(id: params[:id])
    schedule ? render_schedule(schedule) : four_oh_four
  end

  def create
    render_schedule(Schedule.create, 201)
  end

  private

  def render_schedule(schedule, code = 200)
    render json: ScheduleSerializer.new(schedule), status: code
  end
end
