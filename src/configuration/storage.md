# Mail Storage Configuration

## Storage Type

- Name: `INBUCKET_STORAGE_TYPE`
- Default: `memory`
- Values: `file` or `memory`

Selects the storage implementation to use.  Currently Inbucket supports two:

- `file`: stores messages as individual files in a nested directory structure
  based on the hash of the mailbox name.  Each mailbox also includes an index
  file to speed up enumeration of the mailbox contents.
- `memory`: stores messages in RAM, they will be lost if Inbucket is restarted,
  or crashes, etc.

File storage is recommended for larger/shared installations.  Memory is better
suited to desktop or continuous integration test use cases.

## Storage Parameters

- Name: `INBUCKET_STORAGE_PARAMS`
- Default: None
- Examples: `maxkb:10240` or `path:/tmp/inbucket`

Parameters specific to the storage type selected.  Formatted as a comma
separated list of key:value pairs.

### `file` type parameters

- `path`: Operating system specific path to the directory where mail should be
  stored.  `$` characters will be replaced with `:` in the final path value,
  allowing Windows drive letters, i.e. `D$\inbucket`.

### `memory` type parameters

- `maxkb`: Maximum size of the mail store in kilobytes.  The oldest messages in
  the store will be deleted to enforce the limit.  In-memory storage has some
  overhead, for now it is recommended to set this to half the total amount of
  memory you are willing to allocate to Inbucket.

## Retention Period

- Name: `INBUCKET_STORAGE_RETENTIONPERIOD`
- Default: `24h`
- Values: Duration ending in `m` for minutes, `h` for hours, or `0` to disable

If set, Inbucket will scan the contents of its mail store once per minute,
removing messages older than this.  This will be enforced regardless of the type
of storage configured.  In most cases, the configured value should be
significantly longer than one minute.

## Retention Sleep

- Name: `INBUCKET_STORAGE_RETENTIONSLEEP`
- Default: `50ms`
- Values: Duration ending in `ms` for milliseconds, `s` for seconds

Duration to sleep between scanning each mailbox for expired messages.
Increasing this number will reduce disk thrashing, but extend the length of time
required to complete a scan of the entire mail store.

This delay is still enforced for `memory` stores, but could be reduced from the
default.  Setting to `0` may degrade performance of HTTP/SMTP/POP3 services.

## Per Mailbox Message Cap

- Name: `INBUCKET_STORAGE_MAILBOXMSGCAP`
- Default: `500`
- Values: Positive integer, or `0` to disable

Maximum messages allowed in a single mailbox, exceeding this will cause older
messages to be deleted from the mailbox.
