# Lua Events

Inbucket events can be divided into two major categories, _before events_ and
_after events_.

## Before Events

_Before events_ allow extensions to intercept events before Inbucket acts on
them. This gives an event handler the chance to alter the processing of, or
reject the event entirely.

For example, a _before_ event handler could:

- Immediately reject a `MAIL FROM` command when the _from address_ matches a
  particular pattern, returning an error code to the sending SMTP client.
- Detect when a message was sent from a staging environment, and ensure it is
  delivered to the `staging` mailbox in addition to the recipient's mailbox.

Before events **block the active SMTP session** while they are running;
performing expensive operations in the handlers will reduce the perceived
performance of Inbucket; SMTP clients will wait longer to deliver messages, and
messages will take longer to appear in their destination mailboxes.

## After Events

_After events_ allow extensions to take an action after an event has completed.

For example, an _after_ event handler might:

- Notify an HTTP endpoint that a new message has been received, including the
  subject line and senders address.
- Write metadata about a received message to disk, and then allow it to be
  inspected by a waiting continuous integration test by executing a shell
  command.

These events are processed asynchronously with respect to the rest of Inbucket's
services; performing (reasonable) file or network operations within them will
not degrade Inbucket's performance.

## Event Flow

The order in which events occur is:

1. [Before MAIL FROM Accepted](before-mail-from-accepted.md)
1. [Before RCPT TO Accepted](before-rcpt-to-accepted.md)
2. [Before Message Stored](before-message-stored.md)
3. [After Message Stored](after-message-stored.md)
4. [After Message Deleted](after-message-deleted.md)
