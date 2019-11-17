# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  output = []
  for hash in movies_collection do
    output << movie_with_director_name(name, hash)
  end
  output
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  gross_totals = {"Warner Brothers" => 0, "Paramount" => 0, "Weinstein" => 0, "Alpha Films" => 0, "Universal" => 0, "Fox" => 0, "TriStar" => 0, "Focus" => 0, "Dreamworks" => 0, "Sony" => 0, "Miramax" => 0, "MGM" => 0, "Buena Vista" => 0}
  for movie in collection do
<<<<<<< HEAD
    for director in directors_database do
      if director[:name] == movie[:director_name]
        for movies2 in director[:movies] do
          puts movies2
          if movie[:title] == movies2[:title] do
            gross_totals[movies2[:studio]] = gross_totals[movies2[:studio]] + movies2[:worldwide_gross]
          end
        end
      end
    end
  end
  gross_totals
=======
    puts directors_database[directors_database.index(movie[:director_name])]
    gross_totals[directors_database[movie[:director_name]][movie[:title]][:studio]] += directors_database[movie[:director_name]][movie[:title]][:worldwide_gross]
  gross_totals
end
gross_totals
>>>>>>> 3ab3be4d98157c1356c930597acb70001a04c5e6
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  output = []
  for director in source do
    for movie in director[:movies] do
      output << [{:title => movie[:title], :director_name => director[:name]}]
    end
  end
  output
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
