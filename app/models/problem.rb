class Problem < ActiveRecord::Base
	belongs_to :user
	belongs_to :team

	#validation
  	validates_presence_of :user_id, :problem, :plan
end
