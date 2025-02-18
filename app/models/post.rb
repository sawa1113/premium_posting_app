class Post < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, presence: true
    validates :description, { presence: true, length: { maximum: 100 }}

    # Postモデルにおいて、投稿が作成された後に非同期でメール通知ジョブ(PostNotificationJob)を実行している
    after_create_commit { PostNotificationJob.perform_later(self) }

    # 検索可能な属性をリストとして定義します
    def self.ransackable_attributes(auth_object = nil)
        ["title", "description"]
    end
end
