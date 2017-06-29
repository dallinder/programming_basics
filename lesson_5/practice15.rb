arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.each do |hsh|
  hsh.each do |key, value|
    value.delete_if { |num| num % 2 != 0 }
  end
end