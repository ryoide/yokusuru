class ContactController < ApplicationController

	def new
	end

	def create
		redirect_to :root and return
	end
end
