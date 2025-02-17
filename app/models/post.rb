class Post < ApplicationRecord
    after_create_commit { PostNotificationJob.perform_later(self)}

    # 検索可能な属性をリストとして定義します
    def self.ransackable_attributes(auth_object = nil)
        ["title", "description"]
    end
end
