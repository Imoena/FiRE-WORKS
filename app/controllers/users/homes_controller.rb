class Users::HomesController < ApplicationController
  def top
    @posts = Post.limit(3).sort { |a, b| b.liking_users.count <=> a.liking_users.count } # 投稿のいいね数を比較して降順で表示
    @events = Event.all
    @user = current_user
    if user_signed_in?
      @topic_event = Event.where(prefecture: @user.prefecture)#ユーザーが登録した都道府県のeventを配列で探す
      @user_prefecture_posts = Post.where(prefecture: @user.prefecture)
    else
    end
  end

  def about
  end
end