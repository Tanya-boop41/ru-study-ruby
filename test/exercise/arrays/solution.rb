module Exercise
  module Arrays
    class << self

      def max_positive_numb(array)
        max = 0
        array.each do |i|
          max = i if i > max
        end
        max
      end

      def replace(array)
        n = max_positive_numb(array) 
        array.map! do |i|
          i > 0 && i < n ? n : i
        end
      end

      def search(_array, _query)
        0
      end
    end
  end
end
