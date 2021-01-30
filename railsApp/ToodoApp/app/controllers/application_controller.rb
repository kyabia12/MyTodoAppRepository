class ApplicationController < ActionController::Base
  # ApplicationControllerを継承しているクラスで最初に実行される
  # before_actionでdeviseの画面遷移する場合、configure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
  end

  private

  # ログイン後に遷移するページ
  def after_sign_in_path_for(resource)
    # memosのindexに遷移
    # prefixで指定
    memo_index_path
  end

  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    # memosのindexに遷移
    # prefixで指定
    memo_index_path
  end

  # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    # ログイン画面に遷移
    # prefixで指定
    flash[:alert] = "ログアウトしました"
    new_user_session_path
  end
end
