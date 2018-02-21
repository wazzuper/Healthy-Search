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

  def update
    if @doctor.update(doctor_params)
      redirect_to edit_doctor_registration_path(@doctor)
    else
      render 'bio'
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:full_name, :phone_number, :email, :experience, :bio,
                                    :is_cardiologist, :is_dermatologist, :is_endocrinologist,
                                    :is_gastroenterologist, :is_oncologist, :is_ophthalmologist,
                                    :is_pediatrician, :is_physiatrist, :address)
  end
end
