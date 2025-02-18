class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def post_created(post)
        @post = post
        recipient = post.user.email  # 投稿者のメールアドレスを取得
        mail(to: recipient, subject: '投稿が作成されました！')
    end
end
