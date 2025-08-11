module Exercise
  module Arrays
    class << self
      def max_positive_numb(array)
        return nil if array.all?(&:negative?)
        
        max = 0
        array.each do |i|
          max = i if i > max
        end
        max
      end

      def replace(array)
        n = max_positive_numb(array) 
        array.map do |i|
          i > 0 && i < n ? n : i
        end
      end

      def search(array, query, left = 0, right = array.length - 1)
        return -1 if left > right

        middle = (left + right) / 2
        array[middle] == query ? middle : (array[middle] < query ? search(array, query, middle + 1, right) : search(array, query, left, middle - 1))
          
      end
    end
  end
end
