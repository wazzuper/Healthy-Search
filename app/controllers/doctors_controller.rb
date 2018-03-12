class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:index]
  before_action :authenticate_doctor!, except: [:show]

  def index
  end

  def show
  end

  def bio
  end

  def address
  end

  def photo_upload
  end

  def patients
    @appointments = Appointment.where(doctor_id: @doctor).order(created_at: :desc)
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

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:full_name, :phone_number, :email, :experience, :bio,
                                    :is_cardiologist, :is_dermatologist, :is_endocrinologist,
                                    :is_gastroenterologist, :is_oncologist, :is_ophthalmologist,
                                    :is_pediatrician, :is_physiatrist, :address, :avatar,
                                    :remove_avatar, :avatar_cache)
  end
end
