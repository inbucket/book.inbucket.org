local http = require("http")
local json = require("json")

BASE_URL = "https://myapi.example.com"

function inbucket.after.message_stored(msg)
  local data = {
    sender = string.format("Mail from %q", msg.from.address),
    subject = msg.subject
  }

  -- Encode the data table above as JSON.
  local body = json.encode(data)

  -- POST JSON or fail.
  assert(http.post(BASE_URL .. "/notify/text", {
    headers = { ["Content-Type"] = "application/json" },
    body = body,
  }))
end
