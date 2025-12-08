local ltask = require "ltask"
local coroutine = require "test.coroutine"	-- Use coroutine wrap instead of strandard coroutine api

local S = setmetatable({}, { __gc = function() print "User exit" end } )

print ("User init :", ...)
local worker = ltask.worker_id()
print (string.format("User %d in worker %d", ltask.self(), worker))
ltask.worker_bind(worker)	-- bind to current worker thread

function S.ping(...)
	ltask.timeout(10, function() print(1) end)
	ltask.timeout(20, function() print(2) end)
	ltask.timeout(30, function() print(3) end)
	local t = ltask.counter()
	ltask.sleep(40) -- sleep 0.4 sec
	print("TIME:", ltask.counter() - t)
	return "PING", ...
end

function S.exit()
	ltask.quit()
end

return S
