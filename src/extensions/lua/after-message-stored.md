# Lua Event: After Message Stored

Prints metadata of stored messages to STDOUT:

```lua
function inbucket.after.message_stored(msg)
  print("\n## message_stored ##")

  print(string.format("mailbox: %s", msg.mailbox))
  print(string.format("id: %s", msg.id))
  print(string.format("from: %q <%s>",
    msg.from.name, msg.from.address))

  for i, to in ipairs(msg.to) do
    print(string.format("to[%s]: %q <%s>", i, to.name, to.address))
  end

  print(string.format("date: %s", os.date("%c", msg.date)))
  print(string.format("subject: %s", msg.subject))
end
```

Makes a JSON encoded POST to a web service:

```lua
local http = require("http")
local json = require("json")

BASE_URL = "https://myapi.example.com"

function inbucket.after.message_stored(msg)
  local request = json.encode {
    subject = string.format("Mail from %q", msg.from.address),
    body = msg.subject
  }

  assert(http.post(BASE_URL .. "/notify/text", {
    headers = { ["Content-Type"] = "application/json" },
    body = request,
  }))
end
```

Writes data to temporary file and runs external shell command:

```lua
function inbucket.after.message_stored(msg)
  local content = string.format("%q,%q", msg.from, msg.subject)

  -- Write content to temporary file.
  local fnam = os.tmpname()
  local f = assert(io.open(fnam, "w+"))
  assert(f:write(content))
  f:close()

  local cmd = string.format("cat %q", fnam)
  print(string.format("\n### running %s ###", cmd))
  local status = os.execute(cmd)
  if status ~= 0 then
    error("command failed: " .. cmd)
  end
  print("\n")
end
```
