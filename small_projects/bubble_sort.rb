# Bubble sort

def bubble_sort(arr)
    arr.size.times do 
        arr.size.times do |x|
            arr[x], arr[x+1] = arr[x+1], arr[x] if arr[x] > arr[x+1] if x < arr.size - 1
        end
    end
    arr.inspect
end

def bubble_sort_by(arr)
    arr.size.times do
        arr.size.times do |x|
            arr[x], arr[x+1] = arr[x+1], arr[x] if yield(arr[x], arr[x+1]) >= 1 if x < arr.size - 1
        end
    end
    arr.inspect
end

puts bubble_sort([5,7,9,1,4,3,2,4,3,1,2])
puts bubble_sort_by([5,7,9,1,4,3,2,4,3,1,2]) { |x, y| x - y }
