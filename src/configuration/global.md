# Global Configuration

These options affect multiple parts of Inbucket.

## Log Level

- Name: `INBUCKET_LOGLEVEL`
- Default: `info`
- Values: one of `debug`, `info`, `warn`, or `error`

This setting controls the verbosity of log output.  A small desktop installation
should probably select `info`, but a busy shared installation would be better
off with `warn` or `error`.

## Log Coloring

- Name: `NO_COLOR`
- Default: *empty-string*
- Values: *empty-string* (false) or *anything* (true)

This setting is not specific to Inbucket, so there is no `INBUCKET_` prefix, but
is widely supported by many command line tools.  It is used to disable color in
log output.

If set to any value, Inbucket will not use color in log output.  This is useful
when redirecting logs to a file, systemd or other non-interactive output.  Color
is always disabled when logging as JSON or to a file.

## Lua Script

- Name: `INBUCKET_LUA_PATH`
- Default: `inbucket.lua`
- Values: relative or fully qualified path to a file

This is the path to the (optional) Inbucket Lua script.  If the specified file
is present, Inbucket will load it during startup.  Ignored if the file is not
found, or the setting is empty.

## Mailbox Naming

- Name: `INBUCKET_MAILBOXNAMING`
- Default: `local`
- Values: one of `local` or `full` or `domain`

The mailbox naming setting determines the name of a mailbox for an incoming
message, and thus where it must be retrieved from later.

Prior to the addition of the mailbox naming setting, Inbucket always operated in
`local` mode.  Regardless of this setting, the `+` wildcard/extension is not
incorporated into the mailbox name.

### Naming Modes

`local` ensures the domain is removed, such that:

- `james@inbucket.org` is stored in `james`
- `james+spam@inbucket.org` is stored in `james`

`full` retains the domain as part of the name, such that:

- `james@inbucket.org` is stored in `james@inbucket.org`
- `james+spam@inbucket.org` is stored in `james@inbucket.org`

`domain` ensures the local-part is removed, such that:

- `james@inbucket.org` is stored in `inbucket.org`
- `matt@inbucket.org` is stored in `inbucket.org`
- `matt@notinbucket.com` is stored in `notinbucket.com`
