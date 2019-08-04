class Api::V1::SchedulesController < ApplicationController
  def show
    schedule = Schedule.find_by(id: params[:id])
    schedule ? render_schedule(schedule) : four_oh_four
  end

  def create
    schedule = Schedule.new(schedule_params)
    schedule.save ? render_schedule(schedule, 201) : render(json: {message: "You need a name in a request body"}, status: 400)
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

  def schedule_params
    params.permit(:name)
  end
end
