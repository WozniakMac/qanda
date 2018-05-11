require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  describe 'GET /answers' do
    let(:question) { create(:question) }

    it 'works!' do
      get question_answers_path(question)
      expect(response).to have_http_status(200)
    end
  end
end
