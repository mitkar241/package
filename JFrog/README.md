## JFrog
---
Install JFrog using docker-compose
```
docker-compose up -d
```
Installation will take some time.

`N.B.` : Base URL is http://localhost:8081/artifactory, which then maps to http://localhost:8082/ui .
### Credentials
---
default credentials
- Username - `admin`
- Password - `password`
### Use Cases
---
#### Create Repo
Creating repositories via REST API requires Artifactory Pro.
```
~$ curl -u admin:password -X PUT "http://localhost:8081/artifactory/api/repositories/test_repo"
{
  "errors" : [ {
    "status" : 400,
    "message" : "This REST API is available only in Artifactory Pro (see: jfrog.com/artifactory/features). If you are already running Artifactory Pro please make sure your server is activated with a valid license key.\n"
  } ]
}
```
lets create a `LOCAL` repo manually, using GUI, with following config.

`N.B.` : repo `example-repo-local` is created by default initially.
```
~$ curl -u admin:password -X GET "http://localhost:8081/artifactory/api/repositories"
[ {
  "key" : "example-repo-local",
  "description" : "Example artifactory repository",
  "type" : "LOCAL",
  "url" : "http://localhost:8081/artifactory/example-repo-local",
  "packageType" : "Generic"
}, {
  "key" : "test-repo",
  "description" : "This is Public Description.",
  "type" : "LOCAL",
  "url" : "http://localhost:8081/artifactory/test-repo",
  "packageType" : "Generic"
} ]
```
#### Upload File
```
~$ curl -u admin:password -X PUT "http://localhost:8081/artifactory/test-repo/test/sub/resolv.conf" -T resolv.conf
{
  "repo" : "test-repo",
  "path" : "/test/sub/resolv.conf",
  "created" : "2022-01-09T10:41:50.433Z",
  "createdBy" : "admin",
  "downloadUri" : "http://localhost:8081/artifactory/test-repo/test/sub/resolv.conf",
  "mimeType" : "application/octet-stream",
  "size" : "717",
  "checksums" : {
    "sha1" : "e6b5915b590fc5a4fb484d2e456e76466db7bd17",
    "md5" : "fbfde622ae28a4dcfbf73a397a10c6ae",
    "sha256" : "dbefe28051828b529e2299a83a76f268a8cf9fe686b1fa09dec61f7ab1222658"
  },
  "originalChecksums" : {
    "sha256" : "dbefe28051828b529e2299a83a76f268a8cf9fe686b1fa09dec61f7ab1222658"
  },
  "uri" : "http://localhost:8081/artifactory/test-repo/test/sub/resolv.conf"
}
```
#### Download File
```
~$ curl -u admin:password -X GET -O "http://localhost:8081/artifactory/test_repo/test/sub/resolv.conf"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    74  100    74    0     0    178      0 --:--:-- --:--:-- --:--:--   177
~$ ls
resolv.conf
```
#### Delete File
```
~$ curl -u admin:password -X DELETE "http://localhost:8081/artifactory/test-repo/test/sub/resolv.conf"
~$ curl -u admin:password -X DELETE "http://localhost:8081/artifactory/test-repo/test/sub/resolv.conf"
{
  "errors" : [ {
    "status" : 404,
    "message" : "Could not locate artifact 'test-repo:test/sub/resolv.conf' (Nothing to delete)."
  } ]
}
```
#### Check Trashcan
```
~$ curl -u admin:password -X GET "http://localhost:8081/artifactory/api/storage/auto-trashcan"
{
  "repo" : "auto-trashcan",
  "path" : "/",
  "created" : "2022-01-09T10:17:20.690Z",
  "lastModified" : "2022-01-09T10:17:20.690Z",
  "lastUpdated" : "2022-01-09T10:17:20.690Z",
  "children" : [ {
    "uri" : "/test-repo",
    "folder" : true
  } ],
  "uri" : "http://localhost:8081/artifactory/api/storage/auto-trashcan"
}
```
At this point one can still Download the file deleted for some reason.
#### Empty Trashcan
```
~$ curl -u admin:password -X  POST "http://localhost:8081/artifactory/api/trash/empty"
Successfully deleted all trashcan items
```
Now if we check Trashcan...
```
~$ curl -u admin:password -X GET "http://localhost:8081/artifactory/api/storage/auto-trashcan"
{
  "repo" : "auto-trashcan",
  "path" : "/",
  "created" : "2022-01-09T10:17:20.690Z",
  "lastModified" : "2022-01-09T10:17:20.690Z",
  "lastUpdated" : "2022-01-09T10:17:20.690Z",
  "children" : [ ],
  "uri" : "http://localhost:8081/artifactory/api/storage/auto-trashcan"
}
```
`ISSUE` : still the deleted file can be downloaded.
- need to look into the issue.
