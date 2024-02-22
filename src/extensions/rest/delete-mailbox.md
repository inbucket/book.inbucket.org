[Back to REST API](https://github.com/jhillyerd/inbucket/wiki/REST-API)

Purge contents of mailbox.

### URI

`DELETE /api/v1/mailbox/{name}`

### Params

* `name` - name of the mailbox to purge

### Output

JSON encoded string "OK"

### Example

Request: `curl -i -H "Accept: application/json" -X DELETE http://localhost:9000/api/v1/mailbox/swaks`

Response:

    HTTP/1.1 200 OK
    Content-Type: application/json; charset=utf-8
    Expires: -1
    Content-Length: 5
    Date: Tue, 15 Oct 2013 23:58:13 GMT
    
    "OK"
