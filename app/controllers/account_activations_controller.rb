class AccountActivationsController < ApplicationController

  # アカウントを有効化する
  def edit
    user = User.find_by(email: params[:email])
    # ユーザが無効状態の場合
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid acitivation link"
      redirect_to root_url
    end
  end
end
