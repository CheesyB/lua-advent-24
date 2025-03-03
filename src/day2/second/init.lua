-- second
local file = assert(io.open("day2/input.txt", "rb"))
local lines = assert(file:lines())


function Window(array, size)
  if size < 1 then
    error("Window size must be at least 1")
  end

  local idx = 1
  return function()
    if idx + size - 1 <= #array then
      local result = {}
      for i = 0, size - 1 do
        table.insert(result, array[idx + i])
      end
      idx = idx + 1
      return result, idx
    end
  end
end

local FAIL = "fail"
local PASS = "pass"


function CheckPairs(w1, w2, slope)
  if w1 == w2 then
    return FAIL, 0
  end
  local new_slope = w2 - w1
  local absdif = math.abs(new_slope)
  if absdif > 3 then
    return FAIL, 0
  end
  if slope == 0 then
    return PASS, new_slope
  end
  if new_slope < 0 and slope < 0 or new_slope > 0 and slope > 0 then
    return PASS, new_slope
  end
  return FAIL, 0
end

function CheckLine(numbers)
  local slope = 0
  for res, _ in Window(numbers, 2) do
    local w1, w2 = table.unpack(res)
    local state, new_slope = CheckPairs(w1, w2, slope)
    if state == FAIL then
      return FAIL
    end
    slope = new_slope
  end
  return PASS
end

local total_safe = 0

for line in lines do
  local numbers = {}
  for d in line:gmatch("%S+") do
    table.insert(numbers, tonumber(d))
  end

  if CheckLine(numbers) == FAIL then
    for i = 1, #numbers do
      local tmp = { table.unpack(numbers) }
      table.remove(tmp, i)
      if CheckLine(tmp) == PASS then
        total_safe = total_safe + 1
        break
      end
    end
  else
    total_safe = total_safe + 1
  end
  ::skip::
end

print(total_safe)
