# SMTP Service Configuration

## Address and Port

`INBUCKET_SMTP_ADDR`

The IPv4 address and TCP port number the SMTP server should listen on, separated
by a colon.  Some operating systems may prevent Inbucket from listening on port
25 without escalated privileges.  Using an IP address of 0.0.0.0 will cause
Inbucket to listen on all available network interfaces.

- Default: `0.0.0.0:2500`

## Greeting Domain

`INBUCKET_SMTP_DOMAIN`

The domain used in the SMTP greeting:

    220 domain Inbucket SMTP ready

Most SMTP clients appear to ignore this value.

- Default: `inbucket`

## Maximum Recipients

`INBUCKET_SMTP_MAXRECIPIENTS`

Maximum number of recipients allowed (SMTP `RCPT TO` phase).  If you are testing
a mailing list server, you may need to increase this value.  For comparison, the
Postfix SMTP server uses a default of 1000, it would be unwise to exceed this.

- Default: `200`

## Maximum Message Size

`INBUCKET_SMTP_MAXMESSAGEBYTES`

Maximum allowable size of a message (including headers) in bytes.  Messages
exceeding this size will be rejected during the SMTP `DATA` phase.

- Default: `10240000` (10MB)

## Default Recipient Accept Policy

`INBUCKET_SMTP_DEFAULTACCEPT`

If true, Inbucket will accept mail to any domain unless present in the reject
domains list.  If false, recipients will be rejected unless their domain is
present in the accept domains list.

- Default: `true`
- Values: `true` or `false`

## Accepted Recipient Domain List

`INBUCKET_SMTP_ACCEPTDOMAINS`

List of domains to accept mail for when `INBUCKET_SMTP_DEFAULTACCEPT` is false;
has no effect when true.

- Default: None
- Values: Comma separated list of recipient domains
- Example: `localhost,mysite.org`

## Rejected Recipient Domain List

`INBUCKET_SMTP_REJECTDOMAINS`

List of domains to reject mail for when `INBUCKET_SMTP_DEFAULTACCEPT` is true;
has no effect when false.

- Default: None
- Values: Comma separated list of recipient domains
- Example: `reject.com,gmail.com`

## Rejected Origin Domain List

`INBUCKET_SMTP_REJECTORIGINDOMAINS`

List of domains to reject mail from.  This list is enforced regardless of the
`INBUCKET_SMTP_DEFAULTACCEPT` value.

Enforcement takes place during evalation of the `MAIL FROM` SMTP command, the
origin domain is extracted from the address presented and compared against the
list.  It does not take email headers into account.

- Default: None
- Values: Comma separated list of origin domains
- Example: `reject.com,gmail.com`

## Default Recipient Store Policy

`INBUCKET_SMTP_DEFAULTSTORE`

If true, Inbucket will store mail sent to any domain unless present in the
discard domains list.  If false, messages will be discarded unless their domain
is present in the store domains list.

- Default: `true`
- Values: `true` or `false`

## Stored Recipient Domain List

`INBUCKET_SMTP_STOREDOMAINS`

List of domains to store mail for when `INBUCKET_SMTP_DEFAULTSTORE` is false;
has no effect when true.

- Default: None
- Values: Comma separated list of recipient domains
- Example: `localhost,mysite.org`

## Discarded Recipient Domain List

`INBUCKET_SMTP_DISCARDDOMAINS`

Mail sent to these domains will not be stored by Inbucket.  This is helpful if
you are load or soak testing a service, and do not plan to inspect the resulting
emails.  Messages sent to a domain other than this will be stored normally.
Only has an effect when `INBUCKET_SMTP_DEFAULTSTORE` is true.

- Default: None
- Values: Comma separated list of recipient domains
- Example: `recycle.com,loadtest.org`

## Network Idle Timeout

`INBUCKET_SMTP_TIMEOUT`

Delay before closing an idle SMTP connection.  The SMTP RFC recommends 300
seconds.  Consider reducing this *significantly* if you plan to expose Inbucket
to the public internet.

- Default: `300s`
- Values: Duration ending in `s` for seconds, `m` for minutes

## TLS Support Availability

`INBUCKET_SMTP_TLSENABLED`

Enable the STARTTLS option for opportunistic TLS support

- Default: `false`
- Values: `true` or `false`

## TLS Private Key File

`INBUCKET_SMTP_TLSPRIVKEY`

Specify the x509 Private key file to be used for TLS negotiation.
This option is only valid when INBUCKET_SMTP_TLSENABLED is enabled.

- Default: `cert.key`
- Values: filename or path to private key
- Example: `server.privkey`

## TLS Public Certificate File

`INBUCKET_SMTP_TLSCERT`

Specify the x509 Certificate file to be used for TLS negotiation.
This option is only valid when INBUCKET_SMTP_TLSENABLED is enabled.

- Default: `cert.crt`
- Values: filename or path to the certificate key
- Example: `server.crt`
