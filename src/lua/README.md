# Lua API

Lua scripting is the primary way to extend Inbucket's server-side functionality.
Lua event handling functions can react to incoming messages, or alter the way
Inbucket processes them.

<div class="warning">

Lua scripting support is new for Inbucket version 3.1.

We will work to avoid breaking changes, but given the API is incomplete, that
may not be possible.

</div>

At startup, Inbucket will attempt to read the file `inbucket.lua` from the
current directory. The `INBUCKET_LUA_PATH` environment variable may be used to
override both the path and name of the script file.

Once the Lua script has been loaded, Inbucket will look for event handling
functions following this naming pattern: `inbucket.(before|after).<event name>`.

## Your First Event Handler

To play along, download and unpack an [Inbucket
distribution](https://github.com/inbucket/inbucket/releases), then change into
it's directory.  You should see the `inbucket` (or `inbucket.exe`) program, as
well as the `ui` directory.

Create a file named `inbucket.lua`, which will contain a a minimal event
handler that prints the address argument passed to `MAIL FROM` during an SMTP
session to STDOUT:

```lua
{{#include examples/simple.lua}}
```

### Testing

Next, start Inbucket by running `./inbucket` or `.\inbucket.exe` in your
terminal. Inbucket should tell you it's loading inbucket.lua:

```
10:44AM INF Inbucket starting buildDate=undefined phase=startup version=undefined
10:44AM INF Loading script module=lua path=inbucket.lua phase=startup
```

In another terminal window, use `nc` (netcat), `telnet`, or similar, to connect
to localhost port 2500:

- Linux or MacOS
    - `nc localhost 2500`, or
    - `telnet localhost 2500`
- Windows
    - `telnet localhsot 2500` (you may need to install telnet)

Then send the following SMTP commands:

```
HELO localhost
MAIL FROM:<user@example.com>
QUIT
```

In your first terminal, you should see output from your Lua script mixed in
with Inbucket's normal logging:

```
10:45AM INF Starting SMTP session module=smtp remote=127.0.0.1:46916 session=1
>>> LUA got MAIL FROM:  user    example.com
10:45AM INF Mail from: user@example.com module=smtp remote=127.0.0.1:46916 session=1
```

## Next Steps

- The sample above used Lua's `print` function, which does not integrate well
  with Inbucket's formatted log output.  See the [Logging](logging.md) section
  to learn how to output leveled and structured logs.

- Review the [Events](events.md) section to learn more about the types of
  Inbucket events your can handle with Lua.
