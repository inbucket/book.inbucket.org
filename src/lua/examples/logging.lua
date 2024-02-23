-- Loads the logger module and makes it available via the `logger` variable.
local logger = require("logger")

-- The following functions all have the same signature but different names to
-- allow for log leveling.
logger.debug("message at debug level", {})
logger.info("message at info level", {})
logger.warn("message at warn level", {})
logger.error("message at error level", {})

-- Example with formatting and fields.
local orig_addr = "input@example.com"
local new_addr = "output@example.com"

logger.info(
  -- Formats a string for the text of the log entry.
  string.format("Changing address to %q", new_addr),
  -- A Lua table is used for the structured portion of the entry.
  {address = orig_addr})
