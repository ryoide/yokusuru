class ContactMailer < ApplicationMailer
	default from: "deryou0426@gmail.com"

	def post_email(post)
		@post = post
		mail to: "deryou0426@gmail.com", subject: "#{@post.subject}"
	end
end
