user1 = User.create(name: 'antonio', email: 'antonio@gmail.com', password_digest: 'asdfasgdgsfadgf' )
user2 = User.create(name: 'nikolai', email: 'nikolai@gmail.com', password_digest: 'asfdasdfasdgfas')
user3 = User.create(name: 'lauris', email: 'lauris@gmail.com', password_digest: 'asdgfasgerggas' )
user4 = User.create(name: 'mendel' , email: 'mendel@gmail.com' ,  password_digest: 'asrgeshrdg' )

# questions--------------
		question1 = Question.create(user_id: 3, title: 'title1', body: 'what up i am lauris asking a question')
		question2 = Question.create(user_id: 4, title: 'title2', body: 'what up i am mendel asking a question')

		vote1 = Vote.create(user_id: 1, votevalue: 1, votable_id: 1, votable_type: 'Question')
		vote1 = Vote.create(user_id: 2, votevalue: 1, votable_id: 1, votable_type: 'Question')
		vote1 = Vote.create(user_id: 3, votevalue: -1, votable_id: 1, votable_type: 'Question')

# answers------------------
		answer1 = Answer.create(user_id: 1, question_id: 1, body: 'what up I am antonio answering a question nr1')
		answer1 = Answer.create(user_id: 1, question_id: 2, body: 'what up I am antonio answering a question nr2')
		answer1 = Answer.create(user_id: 2, question_id: 2, body: 'what up I am nikolai answering a question nr2')
		answer1 = Answer.create(user_id: 3, question_id: 1, body: 'what up I am lauris answering a question nr1')
		answer1 = Answer.create(user_id: 3, question_id: 2, body: 'what up I am lauris answering a question nr2 too')


		vote1 = Vote.create(user_id: 1, votevalue: 1, votable_id: 1, votable_type: 'Answer')
		vote1 = Vote.create(user_id: 2, votevalue: 1, votable_id: 1, votable_type: 'Answer')
		vote1 = Vote.create(user_id: 3, votevalue: -1, votable_id: 1, votable_type: 'Answer')



		comment1 = Comment.create(user_id: 1, body: 'hello this is comment1 by user1', commentable_id: 1, commentable_type: 'Question' )