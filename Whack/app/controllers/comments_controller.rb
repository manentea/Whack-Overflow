# refactor and improve:
	# - xxxcurrent_user method
	# - after create redirect to respective question

# USER ID CURRENTLY HARD CODED  !!!!!


class CommentsController < ApplicationController

	def index
	  @commentable = find_commentable
	  @comments = @commentable.comments
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@commentable = find_commentable
		@comment = Comment.new
		# byebug
	end

# 	def create
# 		# byebug
# 		@comment =  Comment.new(full_params)
# 		full_params = comment_params
# 		full_params[:user_id] = session[:user_id]
# 		full_params[:commentable_id] = params[:question_id]
# 		# full_params[:commentable_type] = params[]
# 		# byebug
# 		if @comment.save
# 			# redirect_to @comment

# 		else
# 			# render :new
# 		end
# 	end

# 	def create
#   @commentable = find_commentable
#   full_params = comment_params
# 	full_params[:user_id] = session[:user_id]
#   @comment = @commentable.comments.build(full_params)

#   if @comment.save
#     # flash[:notice] = "Successfully created comment."
#     redirect_to :id => nil
#   else
#     render :action => 'new'
#   end
# end

	def create
		@question = Question.find(params[:question_id])
		if params[:answer_id]
			@comment = Comment.new(comment_params)
			@comment[:user_id] = session[:user_id]
			@comment[commentable_id: params[:answer_id], commentable_type: 'Answer']
			@comment.save
			@question.comments << @comment
			redirect_to @comment.commentable
		elsif params[:question_id]
			@comment = Comment.new(comment_params)
			@comment[:user_id] = session[:user_id]
			@comment[commentable_id: params[:question_id], commentable_type: 'Question']
			@comment.save
			@question.comments << @comment
			redirect_to @comment.commentable
		else
			flash[:notice] = "You can't enter an empty comment!"
		end
	end

	def edit
		# @commentable = find_commentable
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		@comment.save
		redirect_to @comment.commentable
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to root_url
	end


	private
		def find_commentable
	  	params.each do |name, value|
	    	if name =~ /(.+)_id$/
	      	return $1.classify.constantize.find(value)
		    end
		  end
		  nil
		end

		def comment_params
			params.require(:comment).permit(:body)
		end

end
