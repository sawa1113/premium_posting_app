class PostNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    UserMailer.post_created(post).deliver_now
  end
end
