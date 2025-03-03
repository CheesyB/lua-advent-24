-- day4 second
local file = assert(io.open("day4/input.txt", "rb"))
local lines = assert(file:lines())

function PrintGrid(grid)
  for k, v in ipairs(grid) do
    print(table.concat(v, ""))
  end
end

function CheckX(grid, i, j)
  return ((grid[i - 1][j - 1] == "M" and grid[i + 1][j + 1] == "S") or
        (grid[i - 1][j - 1] == "S" and grid[i + 1][j + 1] == "M")) and
      ((grid[i - 1][j + 1] == "M" and grid[i + 1][j - 1] == "S") or
      (grid[i - 1][j + 1] == "S" and grid[i + 1][j - 1] == "M"))
end

local grid = {}
local i = 1
for line in lines do
  grid[i] = {}
  for c in line:gmatch "." do
    table.insert(grid[i], c)
  end
  i = i + 1
end


local res = 0
function PlusOne()
  res = res + 1
end

for i = 1, #grid do
  for j = 1, #grid[i] do
    if grid[i][j] == "A" then
      if CheckX(grid, i, j) then PlusOne() end
    end
  end
end

print(res)
