class Post < ApplicationRecord
    belongs_to :user, optional: true

    validates :title, presence: true
    validates :description, { presence: true, length: { maximum: 100 }}

    # Postモデルにおいて、投稿が作成された後に非同期でメール通知ジョブ(PostNotificationJob)を実行している
    after_create_commit { PostNotificationJob.perform_later(self) }

    # 検索可能なカラム(属性)
    def self.ransackable_attributes(auth_object = nil)
        ["title", "description"]
    end

    # 検索を許可する関連(associations)
    def self.ransackable_associations(auth_object = nil)
        ["title", "description"]
    end
end
