require 'rails_helper'

RSpec.describe 'answers/edit', type: :view do
  before do
    @answer = assign(:answer, Answer.create!(
                                body: 'MyText',
                                question: create(:question),
                                user: create(:user)
    ))
  end

  it 'renders the edit answer form' do
    render

    assert_select 'form[action=?][method=?]', answer_path(@answer), 'post' do
      assert_select 'textarea[name=?]', 'answer[body]'
    end
  end
end
