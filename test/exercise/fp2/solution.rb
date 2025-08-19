module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      def initialize(array = [])
        super(array)
      end
      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        return to_enum(:my_each) unless block_given?

        return self if index >= self.length

        yield self[index]
        my_each(index + 1, &block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return to_enum(:my_map) unless block_given?

        result = my_reduce([]) do |acc, el|
          acc << block.call(el)
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce([]) do |acc, el|
          acc << el unless el.nil?
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil, index = 0, &block)
        return nil if self.empty? && initial.nil?

        if initial.nil? && index == 0
          initial = self[0]
          index = 1
        end
        
        return initial if index >= self.length

        new_acc = block.call(initial, self[index])
        
        my_reduce(new_acc, index + 1, &block)  
      end
    end
  end
end
