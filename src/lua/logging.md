# Logging from Lua

Inbucket allows Lua scripts to write log entries via the built-in `logger`
package, with an API provided by [loguago](https://github.com/cosmotek/loguago).

Each logging call must include a level.  Only log entries greater than or equal
to global `INBUCKET_LOGLEVEL` environment variable will be output.   In order of
least to most severe, the available log levels are: `debug`, `info`, `warn`, and
`error`.  Inbucket will output the level `info` and above by default.

## Usage

`logger.<level>(message, fields)`

The first parameter is the log message; you may use Lua's `string.format` to
interpolate values into the message, if needed.  The second parameter is a table
of fields that will be included in the log entry JSON data.  While you are not
required to add fields, the current API requires at least an empty table
parameter.

## Example

```lua
{{#include examples/logging.lua}}
```

Console log output for the example above:

```bash
$ env INBUCKET_LOGLEVEL=debug ./inbucket
```
```
1:49PM INF Loading script module=lua path=inbucket.lua phase=startup
1:49PM DBG message at debug level module=lua
1:49PM INF message at info level module=lua
1:49PM WRN message at warn level module=lua
1:49PM ERR message at error level module=lua
1:49PM INF Mapping address to "output@example.com" address=input@example.com module=lua
```

Example using JSON log output:

```bash
$ env INBUCKET_LOGLEVEL=debug ./inbucket -logjson
```
```json
{"level":"info","module":"lua","phase":"startup","path":"inbucket.lua","time":"2023-11-13T13:54:01-08:00","message":"Loading script"}
{"level":"debug","module":"lua","time":"2023-11-13T13:54:01-08:00","message":"message at debug level"}
{"level":"info","module":"lua","time":"2023-11-13T13:54:01-08:00","message":"message at info level"}
{"level":"warn","module":"lua","time":"2023-11-13T13:54:01-08:00","message":"message at warn level"}
{"level":"error","module":"lua","time":"2023-11-13T13:54:01-08:00","message":"message at error level"}
{"level":"info","module":"lua","address":"input@example.com","time":"2023-11-13T13:54:01-08:00","message":"Mapping address to \"output@example.com\""}
```
