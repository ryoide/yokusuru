class ContactMailer < ApplicationMailer
	default from: "deryou0426@gmail.com"

	def post_email(post)
		@subject = post.subject
		mail to: "deryou0426@gmail.com", subject: "@subject"
	end
end
