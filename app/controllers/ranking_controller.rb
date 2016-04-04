class RankingController < ApplicationController

	def show
		point_6 = current_user.team.problems.where(done: 2).count * 10
		point_3 = current_user.team.problems.where(done: 1).count * 4
		point_1 = current_user.team.problems.where(done: 0).count * 1
		point_all = point_6 + point_3 + point_1
	end
end
