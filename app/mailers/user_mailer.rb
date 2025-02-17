class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def post_created(post)
        @post = post
        mail(to: 'user@example.com', subject: '投稿が作成されました！')
    end
end
