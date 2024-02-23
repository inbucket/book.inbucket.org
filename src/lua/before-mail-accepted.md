# Lua Event: Before Mail Accepted

This event fires when Inbucket is evaluating an SMTP `MAIL FROM` command.

## Example

This example denies mail that is not from `james*@example.com`:
```lua
{{#include examples/before_mail_accepted.lua}}
```

Example SMTP session:

```
220 inbucket Inbucket SMTP ready
HELO localhost
250 Great, let's get this show on the road
MAIL FROM:<bob@example.com>
550 Mail denied by policy
```

Inbucket log output:

```
3:19PM INF Starting SMTP session module=smtp remote=127.0.0.1:40138 session=1
3:20PM INF Inspecting mail from bob@example.com module=lua
3:20PM WRN Rejecting blocked sender user=bob module=lua
3:20PM WRN Extension denied mail from <bob@example.com> module=smtp remote=127.0.0.1:40138 session=1
```
