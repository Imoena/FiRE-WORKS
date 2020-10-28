class ChangePrefectureToDefaultOnPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :posts, :prefecture, from: 0, to: "0"
  end
end
