# Extending Inbucket

Inbucket features a REST API that may be used to read and erase the contents of
mailboxes.  Outgoing webhook functionality is not included, but can be
implemented with Lua.

Lua scripting is the primary way to extend Inbucket's functionality.  Event
handling functions may be used to react to incoming messages, or alter the way
Inbucket processes them.

It is also possible to extend Inbucket in a similar fashion in Go, but due to
the lack of a plugin loader, it will requiring building Inbucket from source.

The following chapters cover each of these extension mechanisms.
