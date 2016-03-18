class Problem < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
	has_many :likes

	#validation
  	validates_presence_of :user_id, :problem, :plan
end
