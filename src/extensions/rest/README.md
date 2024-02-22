# REST API

Allows clients to retrieve, and delete the contents of mailboxes and messages.

## Clients

- Go: <https://godoc.org/github.com/inbucket/inbucket/pkg/rest/client>
- Java: <https://github.com/stepstone-tech/inbucket-java-client>
- Node.js: <https://github.com/Xotabu4/inbucket-js-client>
- Shell: <https://github.com/inbucket/inbucket/blob/master/etc/rest-apiv1.sh>

## API v1

- List Mailbox Contents: [GET /api/v1/mailbox/{name}](get-mailbox.md)
- Get Message: [GET /api/v1/mailbox/{name}/{id}](get-message.md)
- Get Message Source: [GET /api/v1/mailbox/{name}/{id}/source](get-message-source.md)
- Delete Message: [DELETE /api/v1/mailbox/{name}/{id}](delete-message.md)
- Purge Mailbox Contents: [DELETE /api/v1/mailbox/{name}](delete-mailbox.md)
