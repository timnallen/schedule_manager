class Api::V1::SchedulesController < ApplicationController
  def show
    render json: ScheduleSerializer.new(Schedule.find(params[:id]))
  end
end
