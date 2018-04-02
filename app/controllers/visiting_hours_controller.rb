class VisitingHoursController < ApplicationController
  before_action :authenticate_doctor!

  def new
  end

  def create
    day = @day

    visiting_hour = day.visiting_hours.new
    visiting_hour.time = visiting_hour_params[:time]

    if visiting_hour.save
      flash[:notice] = 'Visiting hour added'
    else
      flash[:alert] = 'Something went wrong'
      flash[:alert] = visiting_hour.errors.full_messages
    end

    redirect_back(fallback_location: request.referer)
  end

  def destroy
    day = @day

    visiting_hour = day.visiting_hours.find(params[:id])
    visiting_hour.destroy

    redirect_back(fallback_location: request.referer)
    flash[:alert] = 'Deleted'
  end

  private

  def visiting_hour_params
    params.require(:visiting_hour).permit(:time)
  end
end
