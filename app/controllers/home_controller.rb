class HomeController < ApplicationController

	def index
		@problems = current_user.team.problems
	end
end
