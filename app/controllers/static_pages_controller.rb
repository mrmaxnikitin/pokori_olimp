class StaticPagesController < ApplicationController
	def welcome
		@contests = Contest.all
	end
end
