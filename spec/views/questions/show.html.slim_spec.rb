require 'rails_helper'

RSpec.describe 'questions/show', type: :view do
  before do
    @question = assign(:question, Question.create!(
                                    title: 'Title',
                                    body: 'MyText',
                                    user: create(:user)
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Grzegoz Kovalsky/)
  end
end
