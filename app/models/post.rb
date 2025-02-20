class Post < ApplicationRecord
    belongs_to :user, optional: true
    # 単一画像をアップロードする場合
    has_one_attached :image
    # 複数画像をアップロードする場合
    # has_many_attached :images

    validates :title, presence: true
    validates :description, { presence: true, length: { maximum: 100 }}
    validate :image_content_type
    validate :image_size

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

    # 画像のリサイズを定義
    def resized_image
        return unless image.attached?

        image.variant(resize_to_limit: [300, 300]).processed
    end

    private

    def image_content_type
        return unless image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])

        errors.add(:image, 'はJPEG, PNG, GIFのいずれかの形式にしてください。')
    end

    def image_size
        return unless image.attached? && image.blob.byte_size > 1.megabytes

        errors.add(:image, 'は1MB以下のファイルをアップロードしてください。')
    end
end
