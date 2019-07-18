class PagesController < ApplicationController
	def index
		if params[:search]
			if params[:search]!=''
				@movies = search_by_title_and_body(params[:search])
				if @movies.count > 0
					respond_to do |format|
						format.js { render partial: 'search'}
					end
				else
					respond_to do |format|
						format.js { render partial: 'no_search' }
					end
				end
			else
				respond_to do |format|
					format.js { render partial: 'no_search' }
				end
			end
		else
			@movies = Movie.all
			@action = Movie.where(genre: "Action")
			@thriller = Movie.where(genre: "Thriller")
			@comedy = Movie.where(genre: "Comedy")
		end
	end

	def search_by_title_and_body(search)
	 	Movie.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
	end

end
