module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        return to_enum(:my_each) unless block_given?

        return self if index >= self.length

        yield self[index]
        my_each(index + 1, &block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        return to_enum(:my_map) unless block_given?

        result = []
        my_each do |element|
          result << yield(element)
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []
        my_each do |element|
          result << element unless element.nil?
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        index = 0
        acc = initial

        if acc.nil?
          acc = self[0]
          index = 1
        end
        
        while index < self.length
          acc = yield(acc, self[index])
          index += 1
        end
        acc  
      end
    end
  end
end
