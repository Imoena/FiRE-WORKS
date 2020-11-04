class HomesController < ApplicationController
  def top
  	# 投稿のいいね数を比較して降順で表示
  	@posts = Post.limit(3).sort {|a,b| b.liking_users.count <=> a.liking_users.count}
  end

  def about
  end
end
