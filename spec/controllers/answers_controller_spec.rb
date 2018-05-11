require 'rails_helper'
RSpec.describe AnswersController, type: :controller do
  let(:current_user) { create(:user) }
  let(:question) { create(:question) }
  let(:valid_session) { { user_id: current_user.id } }

  let(:valid_attributes) do
    attributes_for(:answer, user_id: current_user.id, question_id: question.id)
  end

  let(:invalid_attributes) do
    attributes_for(:answer, body: 'a' * 501, user_id: current_user.id, question_id: question.id)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Answer.create! valid_attributes
      get :index, params: { question_id: question.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      answer = Answer.create! valid_attributes
      get :show, params: { id: answer.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { question_id: question.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      answer = Answer.create! valid_attributes
      get :edit, params: { id: answer.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Answer' do
        expect do
          post :create, params: { question_id: question.id, answer: valid_attributes }, session: valid_session
        end.to change(Answer, :count).by(1)
      end

      it 'redirects to the created answer' do
        post :create, params: { question_id: question.id, answer: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Answer.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { question_id: question.id, answer: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { body: 'new body' }
      end

      it 'updates the requested answer' do
        answer = Answer.create! valid_attributes
        put :update, params: { id: answer.to_param, answer: new_attributes }, session: valid_session
        answer.reload
        expect(answer.body).to eq('new body')
      end

      it 'redirects to the answer' do
        answer = Answer.create! valid_attributes
        put :update, params: { id: answer.to_param, answer: valid_attributes }, session: valid_session
        expect(response).to redirect_to(answer)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        answer = Answer.create! valid_attributes
        put :update, params: { id: answer.to_param, answer: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested answer' do
      answer = Answer.create! valid_attributes
      expect do
        delete :destroy, params: { id: answer.to_param }, session: valid_session
      end.to change(Answer, :count).by(-1)
    end

    it 'redirects to the answers list' do
      answer = Answer.create! valid_attributes
      delete :destroy, params: { id: answer.to_param }, session: valid_session
      expect(response).to redirect_to(question_answers_path(question))
    end
  end
end
