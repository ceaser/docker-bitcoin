# docker-bitcoin
A Linux Bitcoin Core node docker container.

## Examples

Here is an example of a docker run line that exposes all ports and mounts the data directory to persist blockchain and wallet files.

```SHELL
docker run -it -p '8333:8333/tcp' -v `pwd`/data:'/data' ceaser/bitcoin
```
