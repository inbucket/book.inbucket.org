local logger = require("logger")

function inbucket.before.rcpt_to_accepted(session)
  logger.info(string.format("Inspecting mail from %s", session.from.address), {})

  -- Reject mail from "bad" user.
  for _, to in ipairs(session.to) do
    logger.info(string.format("Inspecting recipient %s", to.address), {})
    if string.find(to.address, "bad@") == 1 then
      logger.warn("Rejecting blocked recipient", { address = to.address })

      -- Returning `smtp.deny(<code>, "message")` causes the `RCPT TO` command
      -- to be rejected with a custom error.
      return smtp.deny(554, "We don't take kindly to bad users here")
    end
  end

  -- Returning `smtp.defer()` instructs Inbucket to continue processing this
  -- message, respecting it's built-in logic and environment variable config.
  -- Using `smtp.allow()` would force Inbucket to accept this `RCPT TO`.
  return smtp.defer()
end
