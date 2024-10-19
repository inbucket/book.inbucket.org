-- A simple "before MAIL FROM accepted" event handler.
function inbucket.before.mail_from_accepted(from_localpart, from_domain)
  print(">>> LUA got MAIL FROM: ", from_localpart, from_domain)
end
