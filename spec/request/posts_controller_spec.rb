require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'post test' do
    it 'The status should be okay' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:ok)
    end

    it 'The correct template should be rendered' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'The response body should be correct placeholder text' do
      get '/users/:user_id/posts'
      expect(response.body).to include('This is the index action of PostsController')
    end

    it 'The status should be okay' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:ok)
    end

    it 'The correct template should be rendered' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'The response body should be correct placeholder text' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('This is the show action of PostsController')
    end
  end
end
