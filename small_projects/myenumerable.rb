module Enumerable
    def my_each(&block)
        i = 0
        while i < self.size
            yield(self[i])
            i += 1
        end
        self
    end

    def my_each_with_index(&block)
        i = 0
        while i < self.size
            yield(self[i], i)
            i += 1
        end
        self
    end

    def my_select(&block)
        new_arr = []
        self.my_each { |elem| new_arr << elem if yield(elem) }
        new_arr
    end

    def my_all?(&block)
    end

    def my_any?(&block)
    end

    def my_none?(&block)
    end

    def my_inject(result=0, &block)
        self.my_each { |x| 
            result = yield(result, x) 
        }
        result
    end

    def my_count(param=nil, &block)
        count = 0
        if block_given?
            self.my_each { |x| count +=1 if yield(x) }
        elsif param == nil
            count = self.size
        else
            self.my_each {|x| count += 1 if x == param}
        end
        count
    end

    def my_map(proc_param=nil, &block)
        new_arr = %w{} 
        if proc_param
            self.my_each { |x| new_arr << proc_param.call(x) } 
        else
            self.my_each { |x| new_arr << yield(x) }
        end
        new_arr
    end
end

