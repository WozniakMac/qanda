require 'rails_helper'

RSpec.describe 'questions/index', type: :view do
  before do
    assign(:questions, [
             Question.create!(
               title: 'Title',
               body: 'MyText',
               user: create(:user)
             ),
             Question.create!(
               title: 'Title',
               body: 'MyText',
               user: create(:user)
             )
           ])
  end

  it 'renders a list of questions' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Grzegoz Kovalsky', count: 2
  end
end
