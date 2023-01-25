require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe "user test" do
  it "The status should be okay" do
    get "/users"
  expect(response).to have_http_status(:ok)
  end
  
  it "The correct template should be rendered" do
    get "/users"
  expect(response).to render_template(:index)
  end

  it "The response body should be correct placeholder text" do
    get "/users"
    expect(response.body).to include("This is the index action in users controller")

  end  

  it "The status should be okay" do
    get "/users/:id"
  expect(response).to have_http_status(:ok)
  end
  
  it "The correct template should be rendered" do
    get "/users/:id"
  expect(response).to render_template(:show)
  end

  it "The response body should be correct placeholder text" do
    get "/users/:id"
    expect(response.body).to include("Hello Faranosh, this is the show action in users controller")

  end  
  end 

end