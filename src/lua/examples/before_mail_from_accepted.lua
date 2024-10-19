local logger = require("logger")

function inbucket.before.mail_from_accepted(from_localpart, from_domain)
  logger.info(
    string.format("Inspecting mail from %s@%s", from_localpart, from_domain),
    {})

  -- Only allow mail from example.com.
  if from_domain ~= "example.com" then
    logger.warn("Rejecting blocked from domain", { domain = from_domain })

    -- Returning `smtp.deny()` causes the `MAIL FROM` command to be rejected.
    return smtp.deny()
  end

  -- Only allow sending users starting with `james`.
  if string.find(from_localpart, "james") ~= 1 then
    logger.warn("Rejecting blocked sender", { user = from_localpart })

	-- Returning `smtp.deny(<code>, "message")` causes the `MAIL FROM` command
	-- to be rejected with a custom error.
    return smtp.deny(554, "We only accept mail from james")
  end

  -- Returning `smtp.defer()` instructs Inbucket to continue processing this
  -- message, respecting it's built-in logic and environment variable config.
  -- Using `smtp.allow()` would force Inbucket to accept this `MAIL FROM`.
  return smtp.defer()
end
