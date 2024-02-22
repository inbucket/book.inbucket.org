# Get Message Source

Retrieve the unprocessed source of a specific message.

## Specification

### URI

`GET /api/v1/mailbox/{name}/{id}/source`

### Parameters

- `name` - name of the mailbox the message belongs to
- `id` - identifier of the message to retrieve

### Output

Plain text dump of the message headers and body in SMTP format.

## Example

Request: `curl -i -H "Accept: application/json" http://localhost:9000/api/v1/mailbox/swaks/20131015T161202-0000/source`

Response:

```http
HTTP/1.1 200 OK
Content-Type: text/plain
Content-Length: 264
Date: Tue, 15 Oct 2013 23:52:09 GMT

Date: Tue, 15 Oct 2013 16:12:02 -0700
To: swaks@inbucket.local
From: jamehi03@server.com
Subject: Swaks Plain Text
X-Mailer: swaks v20130209.0 jetmore.org/john/code/swaks/

This is a test mailing.

This should be clickable: http://google.com/
```
