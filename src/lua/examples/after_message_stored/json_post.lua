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
