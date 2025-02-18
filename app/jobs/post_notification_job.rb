class PostNotificationJob < ApplicationJob
  queue_as :default

  def perform(post)
    if post.user.present?  # ✅ user が nil でないかチェック
      # メールをすぐ送信する処理
      UserMailer.post_created(post).deliver_now
    else
      # どの投稿 (post_id) にユーザーがいないのかを記録 するためのメッセージ。
      Rails.logger.warn "PostNotificationJob: user is nil for post_id=#{post.id}"
    end
  end
end
