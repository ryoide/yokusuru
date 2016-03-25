class ContactController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.create(name:    create_params[:name],
					   			  mail:    create_params[:mail],
					   			  subject: create_params[:subject],
					   			  content: create_params[:content])

		##############メール送信###############
		ContactMailer.post_email(@contact).deliver

		redirect_to :root and return
	end

	private

	def create_params
		params.require(:contact).permit(:name, :mail, :subject, :content)
	end
end
