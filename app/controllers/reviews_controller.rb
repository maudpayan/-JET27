class ReviewsController < ApplicationController
  def new
    @jet = Jet.find(params[:jet_id])
    @review = Review.new
  end

  def create
    @jet = Jet.find(params[:jet_id])
    @user = current_user
    @review = Review.new(reviews_params)
    @review.jet = @jet
    @review.user = @user
    if @review.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content)
  end
end
