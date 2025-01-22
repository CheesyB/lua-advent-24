
local file = assert(io.open("day1/input.txt", "rb"))
local line = assert(file:lines())

local first = {}
local second = {}


for l in line do
    for f,s in l:gmatch("(%d+)   (%d+)") do
        table.insert(first, f)
        table.insert(second, s)
    end
end

table.sort(first)
table.sort(second)

result = 0

for i = 1,#first do
    result = result + math.abs(first[i] - second[i])
end

print(result)



io.close(file)
