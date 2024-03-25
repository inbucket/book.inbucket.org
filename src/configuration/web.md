# Web Interface Configuration

## Address and Port

`INBUCKET_WEB_ADDR`

The IPv4 address and TCP port number the HTTP server should listen on, separated
by a colon.  Some operating systems may prevent Inbucket from listening on port
80 without escalated privileges.  Using an IP address of 0.0.0.0 will cause
Inbucket to listen on all available network interfaces.

- Default: `0.0.0.0:9000`

## Base Path

`INBUCKET_WEB_BASEPATH`

Base path prefix for UI and API URLs.  This option is used when you wish to
root all Inbucket URLs to a specific path when placing it behind a
reverse-proxy.

For example, setting the base path to `prefix` will move:
- the Inbucket status page from `/status` to `/prefix/status`,
- Bob's mailbox from `/m/bob` to `/prefix/m/bob`, and
- the REST API from `/api/v1/*` to `/prefix/api/v1/*`.

*Note:* This setting will not work correctly when running Inbucket via the npm
development server.

- Default: None

## UI Directory

`INBUCKET_WEB_UIDIR`

This directory contains the templates and static assets for the web user
interface.  You will need to change this if the current working directory
doesn't contain the `ui` directory at startup.

Inbucket will load templates from the `templates` sub-directory, and serve
static assets from the `static` sub-directory.

- Default: `ui/dist`
- Values: Operating system specific path syntax

## Greeting HTML File

`INBUCKET_WEB_GREETINGFILE`

The content of the greeting file will be injected into the front page of
Inbucket.  It can be used to instruct users on how to send mail into your
Inbucket installation, as well as link to REST documentation, etc.

- Default: `ui/greeting.html`

## Monitor Visible

`INBUCKET_WEB_MONITORVISIBLE`

If true, the Monitor tab will be available, allowing users to observe all
messages received by Inbucket as they arrive.  Disabling the monitor facilitates
security through obscurity.

This setting has no impact on the availability of the underlying WebSocket,
which may be used by other parts of the Inbucket interface or continuous
integration tests.

- Default: `true`
- Values: `true` or `false`

## Monitor History

`INBUCKET_WEB_MONITORHISTORY`

The number of messages to remember on the *server* for new Monitor clients.
Does not impact the amount of *new* messages displayed by the Monitor.
Increasing this has no appreciable impact on memory use, but may slow down the
Monitor user interface.

This setting has the same effect on the amount of messages available via
WebSocket.

Setting to 0 will disable the monitor, but will probably break new mail
notifications in the web interface when I finally get around to implementing
them.

- Default: `30`
- Values: Integer greater than or equal to 0

## Performance Profiling & Debug Tools

`INBUCKET_WEB_PPROF`

If true, Go's pprof package will be installed to the `/debug/pprof` URI.  This
exposes detailed memory and CPU performance data for debugging Inbucket.  If you
enable this option, please make sure it is not exposed to the public internet,
as its use can significantly impact performance.

For example usage, see https://golang.org/pkg/net/http/pprof/

- Default: `false`
- Values: `true` or `false`
