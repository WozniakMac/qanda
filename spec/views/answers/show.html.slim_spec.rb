require 'rails_helper'

RSpec.describe 'answers/show', type: :view do
  let(:question) { create(:question) }
  let(:user) { create(:user) }

  before do
    @answer = assign(:answer, Answer.create!(
                                body: 'MyText',
                                question: question,
                                user: user
    ))

    assign(:question, question)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
  end
end
