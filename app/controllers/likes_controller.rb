class LikesController < ApplicationController

	def like
		problem = Problem.find(params[:problem_id])
		like = current_user.likes.build(problem_id: problem.id)
		like.save
		redirect_to :root and return
	end

	def unlike
	end
end
