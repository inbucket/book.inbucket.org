# Inbucket Configuration

Inbucket is configured via environment variables.  Most options have a
reasonable default, but it is likely you will need to change some to suite your
desired use cases.

Running `inbucket -help` will yield a condensed summary of the environment
variables it supports:

```
KEY                                 DEFAULT             DESCRIPTION
INBUCKET_LOGLEVEL                   info                debug, info, warn, or error
INBUCKET_LUA_PATH                   inbucket.lua        Lua script path
INBUCKET_MAILBOXNAMING              local               Use local, full, or domain addressing
INBUCKET_SMTP_ADDR                  0.0.0.0:2500        SMTP server IP4 host:port
INBUCKET_SMTP_DOMAIN                inbucket            HELO domain
INBUCKET_SMTP_MAXRECIPIENTS         200                 Maximum RCPT TO per message
INBUCKET_SMTP_MAXMESSAGEBYTES       10240000            Maximum message size
INBUCKET_SMTP_DEFAULTACCEPT         true                Accept all mail by default?
INBUCKET_SMTP_ACCEPTDOMAINS                             Domains to accept mail for
INBUCKET_SMTP_REJECTDOMAINS                             Domains to reject mail for
INBUCKET_SMTP_REJECTORIGINDOMAINS                       Domains to reject mail from
INBUCKET_SMTP_DEFAULTSTORE          true                Store all mail by default?
INBUCKET_SMTP_STOREDOMAINS                              Domains to store mail for
INBUCKET_SMTP_DISCARDDOMAINS                            Domains to discard mail for
INBUCKET_SMTP_TIMEOUT               300s                Idle network timeout
INBUCKET_SMTP_TLSENABLED            false               Enable STARTTLS option
INBUCKET_SMTP_TLSPRIVKEY            cert.key            X509 Private Key file for TLS Support
INBUCKET_SMTP_TLSCERT               cert.crt            X509 Public Certificate file for TLS Support
INBUCKET_POP3_ADDR                  0.0.0.0:1100        POP3 server IP4 host:port
INBUCKET_POP3_DOMAIN                inbucket            HELLO domain
INBUCKET_POP3_TIMEOUT               600s                Idle network timeout
INBUCKET_WEB_ADDR                   0.0.0.0:9000        Web server IP4 host:port
INBUCKET_WEB_BASEPATH                                   Base path prefix for UI and API URLs
INBUCKET_WEB_UIDIR                  ui/dist             User interface dir
INBUCKET_WEB_GREETINGFILE           ui/greeting.html    Home page greeting HTML
INBUCKET_WEB_MONITORVISIBLE         true                Show monitor tab in UI?
INBUCKET_WEB_MONITORHISTORY         30                  Monitor remembered messages
INBUCKET_WEB_PPROF                  false               Expose profiling tools on /debug/pprof
INBUCKET_STORAGE_TYPE               memory              Storage impl: file or memory
INBUCKET_STORAGE_PARAMS                                 Storage impl parameters, see docs.
INBUCKET_STORAGE_RETENTIONPERIOD    24h                 Duration to retain messages
INBUCKET_STORAGE_RETENTIONSLEEP     50ms                Duration to sleep between mailboxes
INBUCKET_STORAGE_MAILBOXMSGCAP      500                 Maximum messages per mailbox
```

The following sections will describe each of these in more detail.
