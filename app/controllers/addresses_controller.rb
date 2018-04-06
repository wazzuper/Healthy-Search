class AddressesController < ApplicationController
  before_action :set_doctor
  before_action :authenticate_doctor!

  def create
    address = @doctor.create_address(address_params)

    if address.save
      flash[:notice] = 'Address added'
    else
      flash[:alert] = address.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: request.referer)
  end

  def update
    if @doctor.address.update_attributes(address_params)
      flash[:notice] = 'Address updated'
    else
      flash[:alert] = @doctor.address.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: request.referer)
  end

  private

  def set_doctor
    @doctor ||= Doctor.find(params[:doctor_id])
  end

  def address_params
    params.require(:address).permit(:place)
  end
end
