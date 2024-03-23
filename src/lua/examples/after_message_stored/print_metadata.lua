function inbucket.after.message_stored(msg)
  print("\n## message stored ##")

  print(string.format("mailbox: %s", msg.mailbox))
  print(string.format("id: %s", msg.id))
  print(string.format("from: %q <%s>", msg.from.name, msg.from.address))

  -- Loop over each To address.
  for i, to in ipairs(msg.to) do
    print(string.format("to[%s]: %q <%s>", i, to.name, to.address))
  end

  -- Format the unix timestamp in a human readable way.
  print(string.format("date: %s", os.date("%c", msg.date)))

  print(string.format("subject: %s", msg.subject))
end
