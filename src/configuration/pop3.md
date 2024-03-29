# POP3 Service Configuration

## Address and Port

- Name: `INBUCKET_POP3_ADDR`
- Default: `0.0.0.0:1100`

The IPv4 address and TCP port number the POP3 server should listen on, separated
by a colon.  Some operating systems may prevent Inbucket from listening on port
110 without escalated privileges.  Using an IP address of 0.0.0.0 will cause
Inbucket to listen on all available network interfaces.

## Greeting Domain

- Name: `INBUCKET_POP3_DOMAIN`
- Default: `inbucket`

The domain used in the POP3 greeting:

    +OK Inbucket POP3 server ready <26641.1522000423@domain>

Most POP3 clients appear to ignore this value.

## Network Idle Timeout

- Name: `INBUCKET_POP3_TIMEOUT`
- Default: `600s`
- Values: Duration ending in `s` for seconds, `m` for minutes

Delay before closing an idle POP3 connection.  The POP3 RFC recommends 600
seconds.  Consider reducing this *significantly* if you plan to expose Inbucket
to the public internet.
