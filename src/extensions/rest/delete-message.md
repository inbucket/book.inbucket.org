[Back to REST API](https://github.com/jhillyerd/inbucket/wiki/REST-API)

Delete specific message in mailbox.

### URI

`DELETE /api/v1/mailbox/{name}/{id}`

### Params

* `name` - name of the mailbox the message belongs to
* `id` - identifier of the message to delete

### Output

JSON encoded string "OK"

### Example

Request: `curl -i -H "Accept: application/json" -X DELETE http://localhost:9000/api/v1/mailbox/swaks/20131015T161202-0000`

Response:

    HTTP/1.1 200 OK
    Content-Type: application/json; charset=utf-8
    Expires: -1
    Content-Length: 5
    Date: Tue, 15 Oct 2013 23:58:13 GMT
    
    "OK"
