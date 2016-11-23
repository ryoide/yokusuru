class RankingController < ApplicationController

	def show
		team = Team.find(params[:id])
		@users = team.users.order('point ASC').limit(10)
	end
	
	def team_show
		@teams = Team.all.limit(30)
	end
end
