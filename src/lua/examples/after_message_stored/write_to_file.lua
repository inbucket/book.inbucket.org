function inbucket.after.message_stored(msg)
  local content = string.format("%q,%q", msg.from, msg.subject)

  -- Write content to temporary file.
  local fnam = os.tmpname()
  local f = assert(io.open(fnam, "w+"))
  assert(f:write(content))
  f:close()

  local cmd = string.format("cat %q", fnam)
  print(string.format("\n### running %s ###", cmd))
  local status = os.execute(cmd)
  if status ~= 0 then
    error("command failed: " .. cmd)
  end
  print("\n")
end
