--second
local file = assert(io.open("day3/input.txt", "rb"))
local input = assert(file:read("*a"))

local all = {}

local mult_i = 0
while true do
  local _, idx, w1, w2 = string.find(input, "mul%((%d+),(%d+)%)", mult_i)
  if idx == nil then
    break
  end
  all[idx] = w1 * w2
  mult_i = idx
end

local dos_i = 0
while true do
  local _, idx, _ = string.find(input, "do%(%)", dos_i)
  if idx == nil then
    break
  end
  all[idx] = "DO"
  dos_i = idx
end

local donts_i = 0
while true do
  local _, idx, _ = string.find(input, "don%'t%(%)", donts_i)
  if idx == nil then
    break
  end
  all[idx] = "DONT"
  donts_i = idx
end

local a = {}
for k in pairs(all) do table.insert(a, k) end
table.sort(a)

local res = 0
local pick = true
for _, k in ipairs(a) do
  local n = all[k]
  if type(n) == "number" and pick then
    res = res + n
  elseif n == "DO" then
    pick = true
  elseif n == "DONT" then
    pick = false
  end
end

print(res)

