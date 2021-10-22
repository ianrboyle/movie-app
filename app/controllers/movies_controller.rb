class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: {movies: movies.as_json}
  end

  def show
    movie = Movie.find_by(id: params["id"])
    render json: movie.as_json
  end
  def create
    movie = Movie.new(title: params["title"], year: params["year"], plot: params["plot"], director: params["director"], english: params["english"])
    if movie.save
      render json: movie.as_json
    else
      render json: {errors: movie.errors.full_messages}
    end
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.title = params["title"] || movie.title
    movie.year = params["year"] || movie.year
    movie.plot = params["plot"] || movie.plot
    movie.director = params["director"] || movie.director
    movie.english = params["english"] || movie.english
    if movie.save
      render json: movie.as_json
    else
      render json: {errors: movie.errors.full_messages}
    end
  end
  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.destroy
    render json: {message: "Movie removed from the arrchives."}
  end
end
