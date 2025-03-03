-- first
local file = assert(io.open("day2/input.txt", "rb"))
local lines = assert(file:lines())



function window(array, size)
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
            return table.unpack(result)
        end
    end
end

local total_safe = 0

for line in lines do
    local numbers = {}
    for d in line:gmatch("%S+") do
        table.insert(numbers, tonumber(d))
    end

    local slope = 0
    local safe = false
    
    for w1, w2 in window(numbers,2) do
        local new_slope =  w2 - w1 
        if w1 ~= w2 then
            if slope == 0 then
                slope = new_slope
            end
            local absdif = math.abs(new_slope)
            if absdif < 4 then
                
   
                print(slope .. "," .. new_slope)
                if new_slope < 0 and slope < 0 or  new_slope > 0 and slope > 0 then
                    safe = true
                end
            end
        end
        if not safe then
            print("skip")
            goto skip
        else  
            print("no skip")
        end
        slope = new_slope
        safe = false
    end
    total_safe = total_safe + 1
    ::skip::
end

print(total_safe )

