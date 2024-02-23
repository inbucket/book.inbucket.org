local logger = require("logger")

function inbucket.before.mail_accepted(from_localpart, from_domain)
  logger.info(
    string.format("Inspecting mail from %s@%s", from_localpart, from_domain),
    {})

  -- Only allow mail from example.com.
  if from_domain ~= "example.com" then
    logger.warn("Rejecting blocked from domain", { domain = from_domain })

    -- Returning false causes the `MAIL FROM` command to be rejected.
    return false
  end

  -- Only allow sending users starting with `james`.
  if string.find(from_localpart, "james") ~= 1 then
    logger.warn("Rejecting blocked sender", { user = from_localpart })

    return false
  end

  -- Returning true instructs Inbucket to continue processing this message.
  return true
end
