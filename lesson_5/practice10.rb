hsh = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

hsh.map do |x|
  new_hsh = {}

  x.map do |key, value|
    new_hsh[key] = value + 1
  end
  new_hsh
end