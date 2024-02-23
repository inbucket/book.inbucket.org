# Lua Event: Before Message Stored

This event fires after Inbucket has accepted a message, but before it has been stored.

Changes the destination mailbox to `test` from `swaks`, and does not store mail for
`alternate`.

```lua
local logger = require("logger")

-- Original mailbox name on left, new on right.
-- `false` causes mail for that box to be discarded.
local mailbox_mapping = {
  ["swaks"] = "test",
  ["alternate"] = false,
}

function inbucket.before.message_stored(msg)
  local made_changes = false
  local new_mailboxes = {}

  -- Loop over original recipient mailboxes for this message, building up list
  -- of new_mailboxes.
  for index, orig_box in ipairs(msg.mailboxes) do
    local new_box = mailbox_mapping[orig_box]
    if new_box then
      logger.info(string.format("Mapping mailbox %q to %q", orig_box, new_box), {})
      new_mailboxes[#new_mailboxes+1] = new_box
      made_changes = true
    elseif new_box == false then
      logger.info(string.format("Discarding mail for %q", orig_box), {})
      made_changes = true
    else
      -- No match, continue using the original value for this mailbox.
      new_mailboxes[#new_mailboxes+1] = orig_box
    end
  end

  if made_changes then
    -- Recipient mailbox list was changed, return updated msg.
    logger.info(
      string.format("New mailboxes: %s", table.concat(new_mailboxes, ", ")),
      {count = #new_mailboxes})
    msg.mailboxes = new_mailboxes
    return msg
  end

  -- No changes, return nil to signal inbucket to use original msg.
  return nil
end
```
