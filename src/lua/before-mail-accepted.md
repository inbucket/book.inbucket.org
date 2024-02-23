# Lua Event: Before Mail Accepted

This event fires when Inbucket is evaluating an SMTP "MAIL FROM" command.

Denies mail that is not from james*@example.com:

```lua
function inbucket.before.mail_accepted(from_localpart, from_domain)
  print(string.format("\n### inspecting from %s@%s", from_localpart, from_domain))

  if from_domain ~= "example.com" then
    -- Only allow example.com mail
    return false
  end

  if string.find(from_localpart, "james") ~= 1 then
    -- Only allow mailboxes starting with 'james'
    return false
  end

  return true
end
```
