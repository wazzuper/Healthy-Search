class VisitingHoursController < ApplicationController
  before_action :authenticate_doctor!

  def create
    @doctor = Doctor.find(params[:doctor_id])

    visiting_hour = @doctor.visiting_hours.new
    visiting_hour.time = visiting_hour_params[:time]

    if visiting_hour.save
      flash[:notice] = 'Visiting hour added'
    else
      flash[:alert] = 'Something went wrong'
    end

    redirect_back(fallback_location: request.referer)
  end

  private

  def visiting_hour_params
    params.require(:visiting_hour).permit(:time)
  end
end
