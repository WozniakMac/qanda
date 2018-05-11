require 'rails_helper'

RSpec.describe 'answers/index', type: :view do
  let(:question) { create(:question) }
  let(:user) { create(:user) }

  before do
    assign(:answers, [
             Answer.create!(
               body: 'MyText',
               question: question,
               user: user
             ),
             Answer.create!(
               body: 'MyText',
               question: question,
               user: user
             )
           ])

    assign(:question, question)
  end

  it 'renders a list of answers' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
