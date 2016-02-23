class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_movies_by_director(movie_id)
    director = Movie.select(:director).where(id: movie_id).first.director
    Movie.all.where("director = ? and director is not null and not director = ''", director)
  end
end
