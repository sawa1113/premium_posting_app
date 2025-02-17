module Api
    module V1
        class Api::V1::PostsController < ApplicationController
            def index
                @posts = Post.all
            end
        end
    end
end
