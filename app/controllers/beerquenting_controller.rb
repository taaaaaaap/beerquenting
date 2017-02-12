class BeerquentingController < ApplicationController
  before_action :move_to_index, except: :index
  before_filter :search

  def index
    @beerquentings = Review.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    # binding.pry
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

  def search
    @q = Shop.where('area LIKE(?)', "%#{params[:keyword]}%").limit(5)
  end

  def show
    @shop_name = Shop.all
    @review = Review.find(params[:id])
    @comments = Comment.find(params[:id])
  end

  private
  def review_params
    params.permit(:usage,:liquor_kinds,:budget,:image)
  end

  def move_to_index
    redirect_to action: index unless user_signed_in?
  end
end