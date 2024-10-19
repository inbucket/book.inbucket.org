local logger = require("logger")

function inbucket.before.mail_from_accepted(session)
	local from = session.from.address
	logger.info(string.format("Inspecting mail from %s", from),
		{ remote_ip = session.remote_addr })

	-- Only allow mail from example.com, using pattern matching.
	if not string.match(from, [[@example%.com$]]) then
		logger.warn("Rejecting blocked origin domain", { addr = from })

		-- Returning `smtp.deny()` causes the `MAIL FROM` command to be rejected.
		return smtp.deny()
	end

	-- Only allow sending users starting with `james`.
	if string.find(from, "james") ~= 1 then
		logger.warn("Rejecting blocked sender", { addr = from })

		-- Returning `smtp.deny(<code>, "message")` causes the `MAIL FROM` command
		-- to be rejected with a custom error.
		return smtp.deny(554, "We only accept mail from james")
	end

	-- Returning `smtp.defer()` instructs Inbucket to continue processing this
	-- message, respecting it's built-in logic and environment variable config.
	-- Using `smtp.allow()` would force Inbucket to accept this `MAIL FROM`.
	return smtp.defer()
end
