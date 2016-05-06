class ReviewsController < ApplicationController

  def create
    @review = Review.new(rating: params[:review][:rating], content: params[:review][:content])
    @review.author_id = current_user.id
    @review.appointment_id = params[:appointment_id]
    if @review.save
      binding.pry
      redirect_to appointment_path(@review.appointment_id)
    else
      redirect_to appointment_path(@review.appointment_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
