# Lua Event: After Message Stored

This event fires after Inbucket has accepted and stored a message.

## Examples

### Print Metadata

This example prints the metadata of stored messages to the console.  Using
`print()` instead of logging is not advised, but this demonstrates the fields
available on the message paramter.

```lua
{{#include examples/after_message_stored/print_metadata.lua}}
```

Example output:

```
## message stored ##
mailbox: test
id: 8
from: "" <james@localhost>
to[1]: "" <test@inbucket.local>
date: 22 Mar 24 15:09 PDT
subject: Test from Outlook
```

### Webhook style HTTP post as JSON

In this example, message metadata is converted to JSON and a POST request is
made to an external web service:

```lua
{{#include examples/after_message_stored/json_post.lua}}
```

Example JSON body:

```json
{"subject":"Test from Outlook","sender":"Mail from \"james@localhost\""}
```

### Write to file

An example that may be relevant for continuous integration testing.  It writes
metadata to temporary file and runs external shell command on it:

```lua
{{#include examples/after_message_stored/write_to_file.lua}}
```

Example output:

```
### running cat "/tmp/63708877" ###
"james@localhost","Test from Outlook"
```
