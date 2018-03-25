class PagesController < ApplicationController
  def home
    @specializations = Specialization.all
  end

  def registration
  end

  def login
  end
end
