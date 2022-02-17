require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get users_path }

    it 'should return http 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Here is a list of a given user')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(32) }

    it 'should return a correct response' do
      expect(response).to have_http_status(200)
    end

    it 'should render the show template' do
      expect(response).to render_template('show')
    end

    it 'should have the correct text in the template' do
      expect(response.body).to include('Here is a display of a given user')
    end
  end
end
