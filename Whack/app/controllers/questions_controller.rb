# USER ID CURRENTLY HARD CODED 


class QuestionsController < ApplicationController


	def index

		@questions = Question.includes(:comments).all
	end	
	
	def show
		@question = Question.includes(:comments).find(params[:id])
	end

	def new
		@question = Question.new
	end

	def create
		h = question_params
		h[:user_id] = 1
		# xxxcurrent_user.id
		@question = Question.new(h)
		if @question.save
			redirect_to xxxcurrent_user
		else
			render :new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		h = question_params
		h[:user_id] = 1
		# xxxcurrent_user.id
		# byebug
		@question = Question.new(h)
		if @question.update_attributes(h)
			redirect_to @question
		else
			render :edit
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to root_url
	end




	private
		def question_params

			params.require(:question).permit(:title, :body)

		end

		def xxxcurrent_user
			User.find_by(id: session[:user_id])
		end

end
