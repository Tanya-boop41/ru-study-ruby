module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.map do |film|
          countries = film['country']&.split(',')&.map(&:strip)
          rating = film['rating_kinopoisk'].to_f
          countries && countries.size >=2 && rating > 0 ? rating : nil
        end.compact
        return 0 if ratings.empty?
        ratings.reduce(:+) / ratings.size
      end

      def chars_count(films, threshold)
        films
          .map do |film|
            name = film['name']
            rating = film['rating_kinopoisk'].to_f
            rating >= threshold ? name : nil
          end
          .compact
          .map { |name| name.count('и') }
          .reduce(0, :+)  
      end
    end
  end
end
