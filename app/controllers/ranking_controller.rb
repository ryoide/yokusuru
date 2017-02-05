class RankingController < ApplicationController

  def show
    date = "#{Date.today.year}-#{Date.today.month}"
    if date == params[:id]
      team = current_user.team
      @users = team.users.order('point ASC').limit(10)
    else
      team = current_user.team
      date = params[:id].split("-")
      year = date[0]
      month = date[1]
			@user = team.users.order('point ASC').limit(10)
    end
  end

  def team_show
    @teams = Team.all.order('point ASC').limit(30)
  end
end
