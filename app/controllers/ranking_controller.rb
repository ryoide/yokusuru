class RankingController < ApplicationController

	def show
		team = Team.find(params[:id])
		@users = team.users.order('point ASC').limit(10)
	end
end
