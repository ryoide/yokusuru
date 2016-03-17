class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@problems = current_user.team.problems
	end
end
