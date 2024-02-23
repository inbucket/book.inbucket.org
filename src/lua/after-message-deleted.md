# Lua Event: After Message Deleted

Prints some info when a message is deleted:

```lua
function inbucket.after.message_deleted(msg)
  print(string.format("\n### deleted ID %s (subj %q) from mailbox %s", msg.id, msg.subject, msg.mailbox))
end
```
