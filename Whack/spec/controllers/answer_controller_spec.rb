require 'rails_helper'
describe AnswersController do

  describe 'GET #show' do
    it "assigns the requested answer to @answer" do
    answer = create(:answer)
    get :show, id: answer
    expect(assigns(:answer)).to eq answer
  end

  it "renders the :show template" do
    answer = create(:answer)
    get :show, id: answer
    expect(response).to render_template :show
  end
 end

  describe'GET#new' do
    it "assigns a new Answer to @answer" do
    get :new
    expect(assigns(:answer)).to be_a_new(Answer)
  end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
 end
end
