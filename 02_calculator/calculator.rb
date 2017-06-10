#write your code here
def add(x, y)
    x + y
end

def subtract(x, y)
    x - y
end

def sum(array)
    array_sum = 0
    if array.length < 1
        array_sum
    else
        array.each do |element| 
            array_sum += element
        end
    end
    array_sum
end

def multiply(array)
    prod = 1
    array.each { |element| prod *= element }
    prod
end

def power(x, y)
    x ** y
end

def factorial(n)
    if n <= 1
        result = 1
    else
        result = n * factorial(n-1)
    end
    result
end
