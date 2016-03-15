class TopController < ApplicationController
		before_action :home
	def index
	end


	private

	def home
		if user_signed_in?
			redirect_to controller: 'home', action: 'index' and return
		end
	end
end
