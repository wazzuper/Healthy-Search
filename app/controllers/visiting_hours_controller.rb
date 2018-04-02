class VisitingHoursController < ApplicationController
  before_action :set_visiting_day
  before_action :authenticate_doctor!

  def create
    visiting_hour = @visiting_day.visiting_hours.new
    visiting_hour.time = visiting_hour_params[:time]

    if visiting_hour.save
      flash[:notice] = 'Visiting hour added'
    else
      flash[:alert] = 'Something went wrong'
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    visiting_hour = @visiting_day.visiting_hours.find(params[:id])
    visiting_hour.destroy

    redirect_back(fallback_location: request.referer)
    flash[:alert] = 'Deleted'
  end

  private

  def set_visiting_day
    @visiting_day ||= VisitingDay.find(params[:visiting_day_id])
  end

  def visiting_hour_params
    params.require(:visiting_hour).permit(:time)
  end
end
