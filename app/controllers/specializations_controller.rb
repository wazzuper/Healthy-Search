class SpecializationsController < ApplicationController
  before_action :set_page_params

  def index
    filter = params[:search]

    if filter.eql?('')
      @doctors = Doctor.all
    else
      @doctors = Specialization.find_by_name(filter).doctors
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
