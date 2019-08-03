class Api::V1::SchedulesController < ApplicationController
  def show
    schedule = Schedule.find_by(id: params[:id])
    if schedule
      render json: ScheduleSerializer.new(schedule)
    else
      four_oh_four
    end
  end
end
