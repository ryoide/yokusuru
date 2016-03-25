class ContactController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		redirect_to :root and return
	end
end
