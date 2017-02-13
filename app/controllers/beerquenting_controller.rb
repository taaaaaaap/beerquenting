class BeerquentingController < ApplicationController
  before_action :move_to_index, except: :index
  before_filter :search

  def index
    @beerquentings = Review.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create
    # binding.pry
    Review.create(usage:review_params[:usage],liquor_kinds:review_params[:liquor_kinds],budget:review_params[:budget],picture:review_params[:picture],user_id:current_user.id)
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
    @comments = @review.comments.includes(:user)
  end

  private
  def review_params
    params.require(:review).permit(:usage,:liquor_kinds,:budget,:picture)
  end

  def move_to_index
    redirect_to action: index unless user_signed_in?

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:review).permit(:description, :image)
  end
end
end