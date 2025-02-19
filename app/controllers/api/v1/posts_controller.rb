module Api
    module V1
        class Api::V1::PostsController < ApplicationController
            before_action :authenticate_user!

            def index
                @posts = Post.all
                # render :index を指定することで、index.json.jbuilder を適用できる。
                render :index
            end
        end
    end
end
