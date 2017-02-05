class BeerquentingController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @beerquentings = Review.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # binding.pry
  end

  def new
  end

  def create
    Review.create(usage:params[:usage],liquor_kinds: params[:liquor_kinds],budget:params[:budget],image: params[:image],user_id:current_user.id)
  end

  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
    end
  end

  def edit
    @beerquenting = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.update(review_params)
    end
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.includes(:user)
  end

  private
  def review_params
    params.permit(:usage,:liquor_kinds,:budget,:image)
  end

  def move_to_index
    redirect_to action: index unless user_signed_in?
  end
end