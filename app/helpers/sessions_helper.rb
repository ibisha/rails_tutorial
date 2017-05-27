module SessionsHelper

  # 渡されたユーザでログインして、セッションに保存する
  # param ユーザ
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザを返す
  # ログインしていなければnil
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしているかどうかを返す
  def logged_in?
    !current_user.nil?
  end

end
