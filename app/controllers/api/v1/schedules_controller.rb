class Api::V1::SchedulesController < ApplicationController
  def show
    schedule = Schedule.find_by(id: params[:id])
    schedule ? render(json: ScheduleSerializer.new(schedule)) : four_oh_four
  end
end
