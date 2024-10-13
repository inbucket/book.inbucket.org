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

### Example SMTP session

```
220 inbucket Inbucket SMTP ready
HELO localhost
250 Great, let's get this show on the road
MAIL FROM:<james@example.com>
250 Roger, accepting mail from <james@example.com>
RCPT TO:<good@example.com>
250 I'll make sure <good@example.com> gets this
RCPT TO:<bad@example.com>
554 We don't take kindly to bad users here
```

#### Inbucket log output

Notice that our function was called twice; once for each `RCPT TO` command.
The second call received both the `good@example.com` and `bad@example.com`
addresses in the `session.to` field.

```
1:34PM INF Starting SMTP session module=smtp remote=127.0.0.1:40300 session=1
1:34PM INF Mail from: james@example.com module=smtp remote=127.0.0.1:40300 session=1
1:34PM INF Inspecting mail from james@example.com module=lua
1:34PM INF Inspecting recipient good@example.com module=lua
1:34PM INF Inspecting mail from james@example.com module=lua
1:34PM INF Inspecting recipient good@example.com module=lua
1:34PM INF Inspecting recipient bad@example.com module=lua
1:34PM WRN Rejecting blocked recipient address=bad@example.com module=lua
1:34PM WRN Extension denied mail to <{ bad@example.com}> module=smtp remote=127.0.0.1:40300 session=1

```
