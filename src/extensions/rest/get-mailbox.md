# List Mailbox Contents

Retrive the list of messages and their metadata for the specified mailbox.

## Specification

### URI

`GET /api/v1/mailbox/{name}`

### Parameters

- `name` - name of the mailbox to list the contents of

### Output

A JSON array of message header maps, containing the following fields:

- `mailbox` - name of the mailbox the message belongs to
- `id` - message identifier, will be unique for this mailbox, but not across mailboxes
- `from` - message sender
- `subject` - message subject line
- `date` - date message was received (not the date specified by SMTP headers) in [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) format.
- `size` - size of headers + message in bytes

## Example

Request: `curl -i -H "Accept: application/json" http://localhost:9000/api/v1/mailbox/swaks`

Response: (JSON reformatted for readability)

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Expires: -1
Content-Length: 686
Date: Tue, 15 Oct 2013 23:54:36 GMT
```
```json
[
  {
      "mailbox":"swaks",
      "id":"20131015T161202-0000",
      "from":"jamehi03@server.com",
      "subject":"Swaks Plain Text",
      "date":"2013-10-15T16:12:02.231532239-07:00",
      "size":264
  },
  {
      "mailbox":"swaks",
      "id":"20131015T161202-0001",
      "from":"jamehi03@server.com",
      "subject":"Swaks HTML",
      "date":"2013-10-15T16:12:02.292145012-07:00",
      "size":705
  },
  {
      "mailbox":"swaks",
      "id":"20131015T161202-0002",
      "from":"jamehi03@server.com",
      "subject":"Swaks Attachment",
      "date":"2013-10-15T16:12:02.358027334-07:00",
      "size":4802
  },
  {
      "mailbox":"swaks",
      "id":"20131015T161202-0003",
      "from":"jamehi03@server.com",
      "subject":"Test of ȇɲʢȯȡɪɴʛ",
      "date":"2013-10-15T16:12:02.424206527-07:00",
      "size":2946
  }
]
```
