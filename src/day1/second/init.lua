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


score = 0

s1 = {}
s2 = {}

local find = function(input, match)
    local seen = 0
    for i=1,#input do
        if input[i] == match then
            seen = seen + 1
        end
    end
    return seen
end

for i = 1,#first do
    score = score + first[i] * find(second,first[i])
end

print(score)
