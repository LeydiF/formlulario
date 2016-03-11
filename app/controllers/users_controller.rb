class UsersController < ApplicationController
	def contact
		@contact = Contact.new
	end
end
