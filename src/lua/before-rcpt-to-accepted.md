# Lua Event: Before RCPT TO Accepted

This event fires when Inbucket is evaluating an SMTP `RCPT TO` command.

Denying a particular recipient does not reject the entire message.  The
previous `RCPT TO` addresses will be respected, and the SMTP client may
continue at its discretion.

## Example

This example denies recipient addresses with a local-part of `bad`.
```lua
{{#include examples/before_rcpt_to_accepted.lua}}
```

Example SMTP session:

```
```

Inbucket log output:

```
```
