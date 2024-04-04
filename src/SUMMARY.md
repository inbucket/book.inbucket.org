# Summary

[Introduction](README.md)

# User Guide

- [Intended Usage](intended-usage.md)
- [Installation](installation/README.md)
    - [Docker](installation/docker.md)
    - [Linux Packages](installation/linux-package.md)
- [Integration]()
    - [Mail Routing]()
    - [HTTP Proxies]()
- [User Interface]()

# Reference Guide

- [Configuration](configuration/README.md)
    - [Global](configuration/global.md)
    - [SMTP Service](configuration/smtp.md)
    - [POP3 Service](configuration/pop3.md)
    - [Web Interface](configuration/web.md)
    - [Mail Storage](configuration/storage.md)
- [Extending Inbucket](extending.md)
- [REST API](rest/README.md)
    - [List Mailbox Contents](rest/get-mailbox.md)
    - [Get Message](rest/get-message.md)
    - [Get Message Source](rest/get-message-source.md)
    - [Delete Message](rest/delete-message.md)
    - [Purge Mailbox](rest/delete-mailbox.md)
- [Lua API](lua/README.md)
    - [Logging from Lua](lua/logging.md)
    - [Events](lua/events.md)
        - [Before Mail Accepted](lua/before-mail-accepted.md)
        - [Before Message Stored](lua/before-message-stored.md)
        - [After Message Stored](lua/after-message-stored.md)
        - [After Message Deleted](lua/after-message-deleted.md)
- [Go API]()
