# Global Configuration

These options affect multiple parts of Inbucket.

## Log Level

`INBUCKET_LOGLEVEL`

This setting controls the verbosity of log output.  A small desktop installation
should probably select `info`, but a busy shared installation would be better
off with `warn` or `error`.

- Default: `info`
- Values: one of `debug`, `info`, `warn`, or `error`

## Lua Script

`INBUCKET_LUA_PATH`

This is the path to the (optional) Inbucket Lua script.  If the specified file
is present, Inbucket will load it during startup.  Ignored if the file is not
found, or the setting is empty.

- Default: `inbucket.lua`

## Mailbox Naming

`INBUCKET_MAILBOXNAMING`

The mailbox naming setting determines the name of a mailbox for an incoming
message, and thus where it must be retrieved from later.

- Default: `local`
- Values: one of `local` or `full` or `domain`

### `local` ensures the domain is removed, such that:

- `james@inbucket.org` is stored in `james`
- `james+spam@inbucket.org` is stored in `james`

### `full` retains the domain as part of the name, such that:

- `james@inbucket.org` is stored in `james@inbucket.org`
- `james+spam@inbucket.org` is stored in `james@inbucket.org`

Prior to the addition of the mailbox naming setting, Inbucket always operated in
local mode.  Regardless of this setting, the `+` wildcard/extension is not
incorporated into the mailbox name.

### `domain` ensures the local-part is removed, such that:

- `james@inbucket.org` is stored in `inbucket.org`
- `matt@inbucket.org` is stored in `inbucket.org`
- `matt@notinbucket.com` is stored in `notinbucket.com`
