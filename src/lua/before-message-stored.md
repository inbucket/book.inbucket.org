# Lua Event: Before Message Stored

This event fires after Inbucket has accepted a message, but before it has been
stored.

## Example

This example changes the destination mailbox to `newbox` from `oldbox`, and does
not store mail destined for `dropme`.

```lua
{{#include examples/before_message_stored.lua}}
```

Inbucket log output:

```
4:36PM INF Starting SMTP session module=smtp remote=127.0.0.1:52446 session=2
4:36PM INF Mail from: james@localhost module=smtp remote=127.0.0.1:52446 session=2
4:36PM INF Mapping mailbox "oldbox" to "newbox" module=lua
4:36PM WRN Discarding mail for "dropme" module=lua
4:36PM INF New mailboxes: newbox count=1 module=lua
4:36PM INF Message size 312 bytes module=smtp remote=127.0.0.1:52446 session=2
```
