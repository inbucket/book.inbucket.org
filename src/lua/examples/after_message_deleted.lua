local logger = require("logger")

function inbucket.after.message_deleted(msg)
  logger.warn(string.format("Deleted ID %s (subj %q)", msg.id, msg.subject),
    { mailbox = msg.mailbox })
end
