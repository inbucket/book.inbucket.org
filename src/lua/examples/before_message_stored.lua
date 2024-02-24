local logger = require("logger")

-- The mailbox_mapping table controls how mail is routed by this extension:
--
-- Keys (left) hold the original mailbox name.
--
-- Values (right) hold new mailbox name. A value of false causes mail for that
-- box to be discarded.
local mailbox_mapping = {
  ["oldbox"] = "newbox",
  ["dropme"] = false,
}

function inbucket.before.message_stored(msg)
  local made_changes = false
  local new_mailboxes = {}

  -- Loop over each of the original recipient mailboxes for this message,
  -- building up list of new_mailboxes.
  for _, orig_box in ipairs(msg.mailboxes) do
    local new_box = mailbox_mapping[orig_box]
    if new_box then
      logger.info(string.format("Mapping mailbox %q to %q", orig_box, new_box), {})

      new_mailboxes[#new_mailboxes + 1] = new_box
      made_changes = true
    elseif new_box == false then
      logger.warn(string.format("Discarding mail for %q", orig_box), {})

      made_changes = true
    else
      -- No match, continue using the original value for this mailbox.
      new_mailboxes[#new_mailboxes + 1] = orig_box
    end
  end

  if made_changes then
    -- Recipient mailbox list was changed, return the updated msg to Inbucket.
    logger.info(
      string.format("New mailboxes: %s", table.concat(new_mailboxes, ", ")),
      { count = #new_mailboxes })

    msg.mailboxes = new_mailboxes
    return msg
  end

  -- No changes, return nil to signal inbucket to use the original msg.
  return nil
end
