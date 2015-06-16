class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :comments, as: :commentable # Good use of Polymorphic associations
	has_many :votes, as: :votable
  validates :body, presence: true
  validates :title, presence: true

  def vote_count
    self.votes.pluck(:votevalue).sum
  end

  def self.most_popular
    # Move the sort into the database.  Also, usually you want to limit the number of records returned
    Question.all.sort_by {|q| q.vote_count}.reverse
  end

  def sorted_answers
    # Again - do the sort database side
    self.answers.sort_by {|question| question.vote_count}.reverse
  end

end
