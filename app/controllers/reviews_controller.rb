class ReviewsController < ApplicationController
  before_action :authenticate_patient!

  def create
    review = current_patient.reviews.new(
      rating: review_params[:rating],
      comment: review_params[:comment],
      appointment_id: review_params[:appointment_id],
      doctor_id: review_params[:doctor_id]
    )

    if review.save
      flash[:notice] = 'Review added!'
    else
      flash[:alert] = review.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: request.referer)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :patient_id, :doctor_id, :appointment_id)
  end
end
