class ReviewsController < ApplicationController

  def create
    @review = Review.new(rating: params[:review][:rating], content: params[:review][:content])
    @review.author_id = current_user.id
    @review.appointment_id = params[:id]
    binding.pry
    if @review.save
      redirect_to appointment_path(params[:id])
    else
      redirect_to appointment_path(params[:id])
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
