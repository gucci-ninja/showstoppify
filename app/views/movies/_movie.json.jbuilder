json.extract! movie, :id, :title, :year, :imdb_id, :poster_url, :created_at, :updated_at
json.url movie_url(movie, format: :json)
