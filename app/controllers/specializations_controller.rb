class SpecializationsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
end
