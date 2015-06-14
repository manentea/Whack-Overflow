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

	def create
		@comment =  Comment.new(full_params)
		full_params = comment_params
		full_params[:user_id] = 1
		# xxxcurrent_user.id
		full_params[:commentable_id] = params[:question_id]
		full_params[:commentable_type] = params[]
		byebug
		if @comment.save
			# redirect_to @comment

		else
			# render :new
		end
	end

	def create
  @commentable = find_commentable
  full_params = comment_params
	full_params[:user_id] = 1
	# xxxcurrent_user.id
  @comment = @commentable.comments.build(full_params)

  if @comment.save
    # flash[:notice] = "Successfully created comment."
    redirect_to :id => nil
  else
    render :action => 'new'
  end
end


	def edit
		# @commentable = find_commentable
		@comment = Comment.find(params[:id])
	end



	# UPDATE IS MISSSING

	def destroy 
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

		def xxxcurrent_user
			User.find_by(id: session[:user_id])
		end

		def comment_params
			params.require(:comment).permit(:body, :commentable)
		end

end
