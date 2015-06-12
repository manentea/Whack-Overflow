require 'rails_helper'

describe SessionsController do

  context 'sessions#new' do

    it 'returns a successful response' do
      get :new
      expect(response).to be_success
    end

    it 'renders the correct page' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'sessions#create' do
    it 'should '
  end
end
