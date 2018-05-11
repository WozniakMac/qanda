require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'when question is correct' do
    it 'is valid' do
      question = build(:question)
      expect(question).to be_valid
    end
  end

  context 'when question is incorrect' do
    it 'is invalid if title is to short' do
      question = build(:question, title: 'a')
      expect(question).to be_invalid
    end

    it 'is invalid if body is to long' do
      question = build(:question, body: 'a' * 501)
      expect(question).to be_invalid
    end

    it 'is invalid if user empty' do
      question = build(:question, user: nil)
      expect(question).to be_invalid
    end
  end
end
