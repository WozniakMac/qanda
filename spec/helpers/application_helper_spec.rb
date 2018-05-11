require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'markdown' do
    it 'change markdown to html' do
      expect(helper.markdown('Text **text**')).to eq("<p>Text <strong>text</strong></p>\n")
    end
  end
end
