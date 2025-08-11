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

      def search(_array, _query, left = 0, right = _array.length - 1)
        return -1 if left > right

        middle = (left + right) / 2
        if _array[middle] == _query
          middle
        elsif _array[middle] < _query
          search(_array, _query, middle + 1, right)
        else
          search(_array, _query, left, middle - 1)
        end
      end
    end
  end
end
