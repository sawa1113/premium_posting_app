module ApplicationHelper
    def resized_image_tag(post, size = [150, 150])
        return unless post.image.attached?

        image_tag(url_for(post.image.variant(resize_to_limit: size)))
    end
end
