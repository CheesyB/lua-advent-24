-- day5 first
require(' 
local file = assert(io.open("day5/input.txt", "rb"))
local input = assert(file:read("*a"))


function PrintRules(rules, num)
  if rules[num] == nil then
    print("no rules")
  else
    print("Rules for " .. num .. table.concat(rules[num], " "))
  end
end

input = [[
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
]]


function CheckRulesApply(current_rules, to_check)
  local flag = false
  if current_rules == nil then
    return true
  end
  for _, r in ipairs(current_rules) do
    if r == to_check then PrintRules(current_rules, to_check)
      flag = true
    end
  end
  return flag
end

local rules = {}  
for r1, r2 in input:gmatch("(%d+)|(%d+)") do
  if rules[r1] == nil then
    rules[r1] = {}
  end
  table.insert(rules[r1], r2)
end



local updates = {}
local idx = 1

for line in input:gmatch("[^\r\n]+") do
  if not line:find("|") then
    local tmp = {}
    for number in line:gmatch("(%d+)") do
      table.insert(tmp, number)
    end
    table.insert(updates, tmp)
    idx = idx + 1
  end
end

print(table.concat(updates, ","))

local result = 0
for _, up in ipairs(updates) do
  for i = 1, #up do
    local rev_i = #up + 1 - i
    local num = up[rev_i]

    for k = 1, rev_i do
      if CheckRulesApply(rules[up[k]], num) then
        print("skip")
        goto skip
      end
    end
    --print(table.concat(rules[num],":"))
  end
  print(table.concat(up, ","))
  result = result + up[math.ceil(#up / 2)]
  ::skip::
end


print(result)
