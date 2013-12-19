class Comment < ActiveRecord::Base
    include VoteableSesslDec

	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	belongs_to :post
    #has_many :votes, as: :voteable  Moved to Voteable module
    
	validates :body, presence: true

	# using the Voteable module instead of the code below.
    #def total_votes
    #	up_votes - down_votes
    #end

    #def up_votes
    #	self.votes.where(vote: true).size
    #end

    #def down_votes
    #	self.votes.where(vote: false).size
    #end
end