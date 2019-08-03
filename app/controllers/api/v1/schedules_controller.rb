class Api::V1::SchedulesController < ApplicationController
  def show
    schedule = Schedule.find_by(id: params[:id])
    schedule ? render_schedule(schedule) : four_oh_four
  end

  def create
    render_schedule(Schedule.create, 201)
  end

  def destroy
    schedule = Schedule.find_by(id: params[:id])
    schedule ? delete_schedule(schedule) : four_oh_four
  end

  private

  def delete_schedule(schedule)
    schedule.destroy
    render status: 204
  end

  def render_schedule(schedule, code = 200)
    render json: ScheduleSerializer.new(schedule), status: code
  end
end
