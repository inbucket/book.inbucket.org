# Lua Event: After Message Stored

This event fires after Inbucket has accepted and stored a message.

## Examples

Prints metadata of stored messages to STDOUT:

```lua
{{#include examples/after_message_stored/print_metadata.lua}}
```

Makes a JSON encoded POST to a web service:

```lua
{{#include examples/after_message_stored/json_post.lua}}
```

Writes data to temporary file and runs external shell command:

```lua
{{#include examples/after_message_stored/write_to_file.lua}}
```
