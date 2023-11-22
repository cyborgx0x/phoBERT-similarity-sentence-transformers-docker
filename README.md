docker tag smcc/similarity:latest docker-registry.local/smcc/similarity:latest
docker build -t docker-registry.local/smcc/similarity:latest .
docker push docker-registry.local/smcc/similarity:latest