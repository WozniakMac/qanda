require 'rails_helper'

RSpec.describe 'questions/new', type: :view do
  before do
    assign(:question, Question.new(
                        title: 'MyString',
                        body: 'MyText',
                        user: create(:user)
    ))
  end

  it 'renders new question form' do
    render

    assert_select 'form[action=?][method=?]', questions_path, 'post' do
      assert_select 'input[name=?]', 'question[title]'

      assert_select 'textarea[name=?]', 'question[body]'
    end
  end
end
