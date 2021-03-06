class DoctorsController < ApplicationController
  before_action :set_doctor
  before_action :authenticate_doctor!, except: [:show]
  before_action :is_authorised?, except: [:show]

  def show
  end

  def bio
  end

  def address
  end

  def photo_upload
  end

  def profile_area
    @appointments = Appointment.order_by_date_for_doctors(@doctor).paginate(page: params[:page], per_page: 10)
  end

  def specialization
    @specializations = Specialization.all
  end

  def price
  end

  def visiting_days
  end

  def faq
  end

  def update
    if @doctor.update(doctor_params)
      flash[:notice] = 'Updated'
    else
      flash[:alert] = 'Something went wrong'
    end

    # get back to the current page
    redirect_back(fallback_location: request.referer)
  end

  private

  def is_authorised?
    redirect_to root_path, alert: 'You do not have permission for this.' unless current_doctor.id == @doctor.id
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit %i[full_name phone_number email experience bio address
      avatar remove_avatar avatar_cache price active]
  end
end
