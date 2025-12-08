local ltask = require "ltask"

local arg = ...

print "Startup Begin"
print(os.date("%c", (ltask.now())))
local user_addr = ltask.spawn("user", "Hello")

print("Spawn user", user_addr)

local se = ltask.queryservice "sockevent"
print("PING sockevent", se)
print(ltask.call(se, "ping", "PONG"))
print(ltask.call(user_addr, "ping", "PONG"))
-- ltask.send(user_addr, "exit")
