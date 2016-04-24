class ProblemsController < ApplicationController
	before_action :authenticate_user!
	def new
		@problem = Problem.new
	end

	def create
		Problem.create(problem: create_params[:problem], plan: create_params[:plan], user_id: current_user.id, team_id: current_user.team_id, done: 0)
		current_user.point += 1
		current_user.save
    	redirect_to :root and return
	end

	def edit
		problem = Problem.find(params[:id])
		problem.done = problem.done + 1
		if problem.done == 1
			current_user.point += 3
		elsif problem.done == 2
			current_user.point += 6
		end
		current_user.save
		problem.save
		redirect_to :root and return
	end

	private
	def create_params
		params.require(:problem).permit(:problem, :plan)
	end
end
