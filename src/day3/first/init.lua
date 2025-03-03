local file = assert(io.open("day3/input.txt", "rb"))
local input = assert(file:read("*a"))


local res = 0

for f,s in string.gmatch(input,"mul%((%d+),(%d+)%)") do
  res = res + (f * s)
end


print(res)




