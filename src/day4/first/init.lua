-- day4 first
local file = assert(io.open("day4/input.txt", "rb"))
local lines = assert(file:lines())

function PrintGrid(grid)
  for k, v in ipairs(grid) do
    print(table.concat(v, ""))
  end
end

function CheckStraight(grid, i, j)
  return grid[i][j + 1] == "M" and
      grid[i][j + 2] == "A" and
      grid[i][j + 3] == "S"
end

function CheckBack(grid, i, j)
  return grid[i][j - 1] == "M" and
      grid[i][j - 2] == "A" and
      grid[i][j - 3] == "S"
end

function CheckDown(grid, i, j)
  return grid[i + 1][j] == "M" and
      grid[i + 2][j] == "A" and
      grid[i + 3][j] == "S"
end

function CheckUp(grid, i, j)
  return grid[i - 1][j] == "M" and
      grid[i - 2][j] == "A" and
      grid[i - 3][j] == "S"
end

function CheckBackUp(grid, i, j)
  return grid[i - 1][j - 1] == "M" and
      grid[i - 2][j - 2] == "A" and
      grid[i - 3][j - 3] == "S"
end

function CheckBackDown(grid, i, j)
  return grid[i - 1][j + 1] == "M" and
      grid[i - 2][j + 2] == "A" and
      grid[i - 3][j + 3] == "S"
end

function CheckStraigtUp(grid, i, j)
  return grid[i + 1][j - 1] == "M" and
      grid[i + 2][j - 2] == "A" and
      grid[i + 3][j - 3] == "S"
end

function CheckStraightDown(grid, i, j)
  return grid[i + 1][j + 1] == "M" and
      grid[i + 2][j + 2] == "A" and
      grid[i + 3][j + 3] == "S"
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
    if grid[i][j] == "X" then
      if CheckStraight(grid, i, j) then PlusOne() end
      if CheckBack(grid, i, j) then PlusOne() end
      if CheckDown(grid, i, j) then PlusOne() end
      if CheckUp(grid, i, j) then PlusOne() end
      if CheckBackUp(grid, i, j) then PlusOne() end
      if CheckBackDown(grid, i, j) then PlusOne() end
      if CheckStraigtUp(grid, i, j) then PlusOne() end
      if CheckStraightDown(grid, i, j) then PlusOne() end
    end
  end
end

print(res)
