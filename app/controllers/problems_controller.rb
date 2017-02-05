class ProblemsController < ApplicationController
	before_action :authenticate_user!
	def new
		@problem = Problem.new
	end

	def create
		Problem.create(problem: create_params[:problem], plan: create_params[:plan], user_id: current_user.id, team_id: current_user.team_id, status: 0, suggest: Date.today)
		current_user.point += 1
		current_user.team.point += 1
		if  current_user.save && current_user.team.save
    	redirect_to :root and return
		else
			redirect_to :root and return
		end
	end

	def edit
		problem = Problem.find(params[:id])
		problem.status = problem.status + 1
		if problem.status == 1
			current_user.point += 3
			current_user.team.point += 3
			problem.doing = Date.today
		elsif problem.status == 2
			current_user.point += 6
			current_user.team.point += 6
			problem.finish = Date.today
		end
		if current_user.save && problem.save && current_user.team.save
			redirect_to :root and return
		else
			redirect_to :root and return	
		end
	end

	private
	def create_params
		params.require(:problem).permit(:problem, :plan)
	end
end
