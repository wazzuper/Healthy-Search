class PagesController < ApplicationController
  def home
    @specializations = Specialization.all
    @doctors = Doctor.three_best_doctors
  end

  def registration
  end

  def login
  end

  def search
  end
end
