require 'rails_helper'

RSpec.describe 'answers/new', type: :view do
  let(:question) { create(:question) }
  let(:user) { create(:user) }

  before do
    assign(:answer, Answer.new(
                      body: 'MyText',
                      question: question,
                      user: user
    ))

    assign(:question, question)
  end

  it 'renders new answer form' do
    render

    assert_select 'form[action=?][method=?]', question_answers_path(question), 'post' do
      assert_select 'textarea[name=?]', 'answer[body]'
    end
  end
end
