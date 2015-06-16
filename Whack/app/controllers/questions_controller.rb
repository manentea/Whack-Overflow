
class QuestionsController < ApplicationController


	def index
		@questions = Question.includes(:comments).most_popular # Good
	end

	def show
		@question = Question.includes(:comments, :answers).find(params[:id])
	end

	def new
		@question = Question.new
	end

	def create
		# h = question_params
		# h[:user_id] = session[:user_id]
		#@question = Question.new(h)
		@question = current_user.questions.build(question_params) # This is more idiomatic
		if @question.save
			redirect_to @question
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
		h[:user_id] = session[:user_id]
		if @question.update_attributes(h) # Dont use update_attributes.  It bypasses validations.  Use .update
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

end
