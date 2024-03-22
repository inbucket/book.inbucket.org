function inbucket.after.message_stored(msg)
  print("\n## message_stored ##")

  print(string.format("mailbox: %s", msg.mailbox))
  print(string.format("id: %s", msg.id))
  print(string.format("from: %q <%s>",
    msg.from.name, msg.from.address))

  for i, to in ipairs(msg.to) do
    print(string.format("to[%s]: %q <%s>", i, to.name, to.address))
  end

  print(string.format("date: %s", os.date("%c", msg.date)))
  print(string.format("subject: %s", msg.subject))
end
