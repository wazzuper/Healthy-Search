class SpecializationsController < ApplicationController
  def index
    if params[:search].eql?('')
      @doctors = Doctor.all
    else
      @specialization = Specialization.find_by_name(params[:search])
    end
  end
end
