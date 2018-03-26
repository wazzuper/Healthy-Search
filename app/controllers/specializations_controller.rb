class SpecializationsController < ApplicationController
  def index
    @filter = params[:search]

    if @filter.eql?('')
      @doctors = Doctor.all
    else
      @specialization = Specialization.find_by_name(@filter)
    end
  end
end
