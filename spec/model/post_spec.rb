require 'rails_helper'

RSpec.describe Post, type: :model do
    it 'タイトル(title)と説明(description)がある場合、有効であること' do
        post = build(:post)
        expect(post).to be_valid
    end

    it 'タイトル(title)がない場合、無効であること' do
        post = build(:post, title: nil)
        expect(post).not_to be_valid
        expect(post.errors[:title]).to include("を入力してください") 
    end

    it '説明(description)がない場合、無効であること' do
        post = build(:post, description: nil)
        expect(post).not_to be_valid
        expect(post.errors[:description]).to include("を入力してください") 
    end

    it '説明(description)が100文字以内であること' do
        post = build(:post, description: "a" * 101 )
        expect(post).not_to be_valid
        expect(post.errors[:description]).to include("は100文字以内で入力してください") 
    end
end
