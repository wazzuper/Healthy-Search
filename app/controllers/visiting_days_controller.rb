class VisitingDaysController < ApplicationController
  before_action :authenticate_doctor!

  def create
    @doctor = Doctor.find(params[:doctor_id])

    visiting_day = @doctor.visiting_days.new
    visiting_day.date = visiting_day_params[:date]

    if visiting_day.save
      flash[:notice] = 'Visiting dat added'
    else
      flash[:alert] = 'Something went wrong'
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @doctor = Doctor.find(params[:doctor_id])

    visiting_day = @doctor.visiting_days.find(params[:id])
    visiting_day.destroy

    redirect_back(fallback_location: request.referer)
    flash[:alert] = 'Deleted'
  end

  private

  def visiting_day_params
    params.require(:visiting_day).permit(:date)
  end
end
