class VisitingDaysController < ApplicationController
  before_action :set_doctor
  before_action :authenticate_doctor!

  def show
    @visiting_day = VisitingDay.find(params[:id])
  end

  def create
    visiting_day = @doctor.visiting_days.new
    visiting_day.date = visiting_day_params[:date]

    if visiting_day.save
      flash[:notice] = 'Visiting date added'
    else
      flash[:alert] = visiting_day.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    visiting_day = @doctor.visiting_days.find(params[:id])
    visiting_day.destroy

    redirect_back(fallback_location: request.referer)
    flash[:alert] = 'Deleted'
  end

  private

  def set_doctor
    @doctor ||= Doctor.find(params[:doctor_id])
  end

  def visiting_day_params
    params.require(:visiting_day).permit(:date)
  end
end
