class TopController < ApplicationController
		before_action :home
	def index
		@contact = Contact.new
	end

	def privacy
	end

	private

	def home
		if user_signed_in?
			redirect_to controller: 'home', action: 'index' and return
		end
	end
end
