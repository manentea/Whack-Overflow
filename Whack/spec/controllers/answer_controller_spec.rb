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
end
