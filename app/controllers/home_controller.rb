class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@problems = current_user.team.problems.where(done: 0)
		@proposals = current_user.team.problems.where(done: 1)
	end

	def doing
		@problems = current_user.team.problems.where(done: 1)
	end
end
