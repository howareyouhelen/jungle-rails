class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product

    if @review.save!
      redirect_to @product, notice: 'Review has been saved successfully.'
    else
      redirect_to @product, notice: 'Review did not save.'
    end
  end

  def destroy 
    @review = Review.find(params[:id])
    @review.destroy!
    redirect_to @review.product, notice: 'Review was successfully destroyed'

  end

  private 
  def review_params
    params.require(:review).permit(:user_id, :description, :rating)
  end
end
