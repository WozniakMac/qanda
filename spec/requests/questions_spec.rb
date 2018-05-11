require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'GET /questions' do
    it 'works!' do
      get questions_path
      expect(response).to have_http_status(200)
    end
  end
end
