class ProblemsController < ApplicationController
	before_action :authenticate_user!
	def new
		@problem = Problem.new
	end

	def create
		Problem.create(problem: create_params[:problem], plan: create_params[:plan], user_id: current_user.id, team_id: current_user.team_id)
    	redirect_to :root and return
	end

	private
	def create_params
		params.require(:problem).permit(:problem, :plan)
	end
end
