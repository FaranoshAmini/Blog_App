require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  before(:example) do
    @user = User.create(id: 1, name: 'Farah', photo: 'img.jpg', bio: 'Developer', posts_counter: 0)
    @post = Post.create(title: 'Intro to JS', text: 'Full Stack Development',
                        comments_counter: 0, likes_counter: 0, author_id: @user.id)
  end
  describe 'post test' do
    it 'The status should be okay' do
      get user_posts_path(user_id: @user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'The correct template should be rendered' do
      get user_posts_path(user_id: @user.id)
      expect(response).to render_template(:index)
    end

    it 'The response body should be correct placeholder text' do
      get user_posts_path(user_id: @user.id)
      expect(response.body).to include('This is the index action of PostsController')
    end

    it 'The status should be okay' do
      get user_post_path(user_id: @user.id, post_id: @post.id)
      expect(response).to have_http_status(:ok)
    end

    it 'The correct template should be rendered' do
      get user_post_path(user_id: @user.id, post_id: @post.id)
      expect(response).to render_template(:show)
    end

    it 'The response body should be correct placeholder text' do
      get user_post_path(user_id: @user.id, post_id: @post.id)
      expect(response.body).to include('This is the show action of PostsController')
    end
  end
end
