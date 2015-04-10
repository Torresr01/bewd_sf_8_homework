class MoviesController < ApplicationController
  	before_action :set_movie, only: [:show, :edit, :update, :destroy]



  def index
  	@movies = Movie.all
 	end

 	def new
 		@movie = Movie.new
 	end 

 	def search
 		@movies = Movie.search(params[:q]) 
 		@search_message = 'found'
 			if @movies.count == 0
 						@movies = Movie.all
 						@search_message = 'none'
 			end
 	end

 	def show
 		@movie = Movie.find(params[:id])
 	end

 	def edit
 		@movie = Movie.find(params[:id])
 	end

 	def create
 		@movie = Movie.new(safe_movie_params)

		 	respond_to do |f|
				if @movie.save
						f.html { redirect_to @movie, notice: 'Movie was successfully created.' }
				else
						f.html { render :new }
				end
			end
 	end 

 	def update
   @movie.update(params[:q]) == @movie

    respond_to do |f|
      if @movie.update(safe_movie_params)
      		f.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
      else
        	format.html { render :edit }
      end
    end
 	end

 private

 	def set_movie
 		@movie = Movie.find(params[:id])
 	end

 	def safe_movie_params
 		params.require(:movie).permit(:title,:description,:year_released)
 	end
end
