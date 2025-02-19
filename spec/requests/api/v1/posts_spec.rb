require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
    let(:user) { create(:user) }  # ログインユーザーを作成
    let!(:posts) { create_list(:post, 2, user: user) }  # 投稿を2件作成
  
    before do
        sign_in user  # Deviseのsign_inメソッドでログイン
    end

    describe "GET /api/v1/posts" do
        let!(:posts) { create_list(:post, 2) }  # 2つの投稿を作成

        it "投稿一覧を取得できること" do
            get "/api/v1/posts"
            expect(response).to have_http_status(:ok)

            json = JSON.parse(response.body)
            expect(json["posts"].length).to eq(2)  # 投稿データが2件あることを確認
        end
    end
end
