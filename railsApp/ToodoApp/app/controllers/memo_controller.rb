class MemoController < ApplicationController
  layout 'memo'
  before_action :authenticate_user!

  def index
    @memos = Memo.where('user_id == ?', current_user.id)
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new(user_id: current_user.id)
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  # memoの新規作成
  def create
    # formから受け取った値からmemoインスタンスを生成
    @memo = Memo.new(memo_params)

    # memoの保存の確認
    if @memo.save
      # 保存に成功した場合
      redirect_to '/memo'
    else 
      # 保存に失敗した場合
      redirect_to '/memo/new'
    end
  end

  def update
    memo = Memo.find(params[:id]) 
    memo.update(memo_params)
    redirect_to '/memo'
  end

  # memoの削除
  def destroy
    # 削除するmemoを取得 
    memo = Memo.find(params[:id])

    # 削除するmemoがログイン済のユーザのものである場合
    if memo.user_id == current_user.id
      # memoを削除
      memo.destroy
    end
    redirect_to '/memo'
  end

  private

  def memo_params
    params.require(:memo).permit(:user_id, :title, :content)
  end
end