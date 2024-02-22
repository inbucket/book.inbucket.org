# REST API
## Clients

* Go: https://godoc.org/github.com/inbucket/inbucket/pkg/rest/client
* Java: https://github.com/stepstone-tech/inbucket-java-client
* Node.js: https://github.com/Xotabu4/inbucket-js-client
* Shell: https://github.com/inbucket/inbucket/blob/master/etc/rest-apiv1.sh

## API v1

* List Mailbox Contents: [GET /api/v1/mailbox/{name}](https://github.com/inbucket/inbucket/wiki/REST-GET-mailbox)
* Get Message: [GET /api/v1/mailbox/{name}/{id}](https://github.com/inbucket/inbucket/wiki/REST-GET-message)
* Get Message Source: [GET /api/v1/mailbox/{name}/{id}/source](https://github.com/inbucket/inbucket/wiki/REST-GET-message-source)
* Delete Message: [DELETE /api/v1/mailbox/{name}/{id}](https://github.com/inbucket/inbucket/wiki/REST-DELETE-message)
* Purge Mailbox Contents: [DELETE /api/v1/mailbox/{name}](https://github.com/inbucket/inbucket/wiki/REST-DELETE-mailbox)