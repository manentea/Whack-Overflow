require 'rails_helper'

describe CommentsController do 

	let(:valid_comment) {Comment.create(user_id: 1, body: 'body1', 
																			commentable_id: 1, commentable_type: 'Question') }
	let(:invalid_comment1) {Comment.create(user_id: 1, body: '', 
																			commentable_id: 1, commentable_type: 'Question') }
	let(:invalid_comment2) {Comment.create(user_id: '', body: 'body2', 
																			commentable_id: 1, commentable_type: 'Question') }
	let!(:user) {User.create(name: 'Antonio', email: 'antonio@gmail.com', 
													password_digest: '12345')}

	

	context 'comments#show' do

		it 'returns successful response' do
			get :show, id: valid_comment.id
			expect(response).to be_success
		end

		it 'renders the show template' do
			get :show, id: valid_comment.id
			expect(response).to render_template :show
 		end
		
		it 'correctly assigns variable @comment' do
			get :show, id: valid_comment.id
			expect(assigns(:comment)).to eq(valid_comment)
		end
	end


	context 'comments#new' do
		it 'returns successful response' do
			get :new
			expect(response).to be_success
		end

		it 'renders new template' do
			get :new
			expect(response).to render_template :new
		end

		it 'assigns correct variable @comment' do
			get :new
			expect(assigns(:comment)).to be_a_new Comment
		end
	end

	context 'comments#create' do
		it 'creates a comment with valid attribtutes' do
			session[:user_id] = 1
			expect {
				method :post, comment: {body: 'body1',
															 commentable_id: 1, commentable_type: 'Question'}
			}.to change { Question.count}.by(1)
		end

		it 'doesnt create a comment with empty body' do
			session[:user_id] = 1
			expect {
				method :post, comment: {body: '',  
															commentable_id: 1, commentable_type: 'Question'}
			}.not_to change {Question.count}
		end

		it 'doesnt create a comment if a user doesnt have a session id' do

			expect {
				method :post, comment: {body: 'blabla',  
															commentable_id: 1, commentable_type: 'Question'}
			}.not_to change {Question.count}
		end
	end

	context 'comments#edit' do
		it 'assigns the correct variable to @comment' do
			get :edit, id: valid_comment.id
			expect(assigns(:comment)).to eq(valid_comment)
		end

		it 'renders the edit template ' do
			get :edit, id: valid_comment.id 
			expect(response).to render_template :edit
		end
	end


	context 'comment#destroy' do
		it 'deletes comment' do
			expect {
				delete :destroy, id: valid_comment.id
			}.to change {Comment.count}.by(-1)
		end
	end
	


	
end