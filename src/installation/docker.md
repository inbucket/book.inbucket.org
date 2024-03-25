# Docker Build

Inbucket images are automatically built and pushed to [Docker Hub] and the
[GitHub Container Registry]. The main Inbucket repo contains the [Dockerfile],
which allows you to build your own [Docker] image.

## Running

```sh
docker run -d --name inbucket -p 9000:9000 -p 2500:2500 -p 1100:1100 inbucket/inbucket
```

Then point your browser at <http://localhost:9000/>.

## Image Tags

- `latest` tracks the most recent stable release
- `edge` tracks the potentially unstable `main` branch
- _versions_ are also tagged, ie `3.1.0-beta2`

## Volumes

- `/config` will contain the default `greeting.html` file (after first start,)
  which may be customized for your users
- `/storage` holds emails received by Inbucket

## Default Configuration

The initial configuration is set by the `ENV` statements in the Configuration
section of our [Dockerfile].  You may use Docker environment variables to
override or further customize Inbucket.


[Docker]:                    https://www.docker.com/
[Dockerfile]:                https://github.com/inbucket/inbucket/blob/main/Dockerfile
[Docker Hub]:                https://hub.docker.com/r/inbucket/inbucket/
[GitHub Container Registry]: https://github.com/inbucket/inbucket/pkgs/container/inbucket
