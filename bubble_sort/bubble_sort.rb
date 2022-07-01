def bubble_sort array
  n = array.length
  did_any_bubble = true
  for i in 1..(n - 1) do
    break unless did_any_bubble
    did_any_bubble = false
    for j in 0..(n - 1 - i) do
    if array[j + 1] <= array[j]
      array[j], array[j + 1] = array[j + 1], array[j]
      did_any_bubble = true
    end
    end
  end
  array
end

puts bubble_sort([4,3,78,2,0,2]) #=>  [0,2,2,3,4,78]
