module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.
      def initialize(array = [])
        super(array)
      end
      # Написать свою функцию my_each
      def my_each(&block)
        return to_enum(:my_each) unless block_given?
        return MyArray.new(self) if empty?

        yield first
        MyArray.new(self[1..]).my_each(&block)

        MyArray.new(self)
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return to_enum(:my_map) unless block_given?

        result = my_reduce(MyArray.new) do |acc, el|
          acc << block.call(el)
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce(MyArray.new) do |acc, el|
          acc << el unless el.nil?
          acc
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return nil if empty? && acc.nil?

        if acc.nil?
          acc = first
          return MyArray.new(self[1..]).my_reduce(acc, &block)
        end
        
        return acc if empty?

        new_acc = block.call(acc, first)
        MyArray.new(self[1..]).my_reduce(new_acc, &block)  
      end
    end
  end
end
