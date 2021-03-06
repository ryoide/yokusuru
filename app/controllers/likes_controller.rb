class LikesController < ApplicationController

	def like
		@problem = Problem.find(params[:problem_id])

		problem = Problem.find(params[:problem_id])
		like = current_user.likes.build(problem_id: problem.id)
		like.save
	end

	def unlike
		@problem = Problem.find(params[:problem_id])
		
		problem = Problem.find(params[:problem_id])
		like = current_user.likes.find_by(problem_id: problem.id)
		like.destroy
	end
end
