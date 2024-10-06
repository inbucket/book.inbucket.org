# Lua Event: Before MAIL FROM Accepted

This event fires when Inbucket is evaluating an SMTP `MAIL FROM` command.

## Example

This example denies mail that is not from `james*@example.com`:
```lua
{{#include examples/before_mail_from_accepted.lua}}
```

Example SMTP session:

```
220 inbucket Inbucket SMTP ready
HELO localhost
250 Great, let's get this show on the road
MAIL FROM:<bob@example.com>
554 We only accept mail from james
```

Inbucket log output:

```
1:17PM INF Starting SMTP session module=smtp remote=127.0.0.1:51726 session=1
1:17PM INF Inspecting mail from bob@example.com module=lua remoteip=127.0.0.1
1:17PM WRN Rejecting blocked sender addr=bob@example.com module=lua
1:17PM WRN Extension denied mail from <bob@example.com> module=smtp remote=127.0.0.1:51726 session=1
```
