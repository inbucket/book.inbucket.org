# Get Message

Retrieve a specific message, with the headers and MIME data parsed into JSON.

## Specification

### URI

`GET /api/v1/mailbox/{name}/{id}`

### Parameters

- `name` - name of the mailbox the message belongs to
- `id` - identifier of the message to retrieve
  - Using an `id` of `latest` will retrieve the most recent message in the mailbox

### Output

- The Inbucket version of the message headers (same as returned by [List Mailbox Contents](get-mailbox.md))
- The parsed SMTP headers (not converted to UTF-8)
- The decoded Text and HTML portions of the MIME body of the email
- A list of attachments

## Example

Request: `curl -i -H "Accept: application/json" http://localhost:9000/api/v1/mailbox/swaks/20131016T164638-0001`

Response: (JSON reformatted for readability)

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Expires: -1
Content-Length: 810
Date: Thu, 17 Oct 2013 21:51:59 GMT
```
```json
{
    "mailbox": "swaks",
    "id": "20131016T164638-0001",
    "from": "jamehi03@server.com",
    "subject": "Swaks HTML",
    "date": "2013-10-16T16:46:38.646370568-07:00",
    "size": 705,
    "body": {
        "text": "This is a test mailing.\r\n\r\nThis should be clickable: http://google.com/\r\n",
        "html": "<html>\n<body>\n<p>This is a test mailing <b>in HTML</b></p>\n\n<p>This should be clickable: [...]"
    },
    "header": {
        "Content-Type": [
            "multipart/alternative; boundary=\"----=_MIME_BOUNDARY_000_62717\""
        ],
        "Date": [
            "Wed, 16 Oct 2013 16:46:38 -0700"
        ],
        "From": [
            "jamehi03@server.com"
        ],
        "Mime-Version": [
            "1.0"
        ],
        "Subject": [
            "Swaks HTML"
        ],
        "To": [
            "swaks@inbucket.local"
        ]
    },
    "attachments": [
        {
            "filename": "favicon.png",
            "content-type": "image/png",
            "download-link": "http://localhost:9000/mailbox/dattach/swaks/20131016T164638-0001/0/favicon.png",
            "view-link": "http://localhost:9000/mailbox/vattach/swaks/20131016T164638-0001/0/favicon.png",
            "md5": "a72a7565b6b6587ac15fc35746307d0e"
        }
    ]
}
```
