class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @reviews = User.reviews.page(params[:page]).per(5).order("created_at DESC")
  end

def create
    if env['omniauth.auth'].present?
        # Facebookログイン
    @user  = User.from_omniauth(env['omniauth.auth'])
    result = @user.save(context: :facebook_login)
    fb = "Facebook"
    else
    # 通常サインアップ
    @user  = User.new(strong_params)
    result = @user.save
    fb       = ""
    end
    if result
      sign_in @user
      flash[:success] = "#{fb}ログインしました。"
      redirect_to @user
    else
      if fb.present?
          redirect_to auth_failure_path
      else
        render 'new'
      end
    end
end

end
