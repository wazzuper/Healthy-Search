class SpecializationsController < ApplicationController
  before_action :set_page_params

  def index
    filter = params[:search]

    if Specialization.list_of_specializations.include?(filter)
      @doctors = Specialization.find_by_name(filter).doctors
    else
      @doctors = Doctor.all
    end
  end

  def show
    @doctors = Specialization.find(params[:id]).doctors
  end

  private

  def set_page_params
    @page_params = params[:page]
  end
end
