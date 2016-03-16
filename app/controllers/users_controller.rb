class UsersController < ApplicationController

	def avatar
		@login = Login.all
	end



end
