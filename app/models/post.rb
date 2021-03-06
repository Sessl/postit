class Post < ActiveRecord::Base
    include VoteableSesslDec
    include Sluggable

	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
    #has_many :votes, as: :voteable  The association was moved to the included method in the Voteable module

    validates :title, presence: true, length: {minimum: 5}
    validates :url, presence: true, uniqueness: true
    validates :description, presence: true
    
    sluggable_column :title
    #before_save :generate_slug

    # moving the methods below to Voteable module under lib
    #def total_votes
    #	up_votes - down_votes
    #end

    #def up_votes
    	#self.votes.where(vote: true).size
    #end

    #def down_votes
    	#self.votes.where(vote: false).size
    #end

    #def generate_slug
    #    self.slug = self.title.gsub(' ', '-').downcase
    #end

    #def to_param
    #    self.slug
    #end
end