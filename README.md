## Running UAA token server
	The sample `uaa.yml` configuration tells the UAA server to store its data in a postgresql database. If you change it to something else, then skip to the next chapter.
	To easily create a postgresql database on your local dev environment, use Docker. The following command creates a local [postgresql container](https://registry.hub.docker.com/_/postgres/) with a default database called 'postgres' and a default user 'postgres'.
docker build -t some/uaa:3.9.9 .
exec to get in: docker exec -it '123-containerid'  /bin/bash
## Running the UAA server
	To run the UAA server, first you'll need a configuration file. UAA accepts a YAML config file where the default clients and users can be defined among some other things, like where to store the data. You can find a basic configuration in the project repository. The default configuration stores data in a sql database whose connection parameters are defined in environment variables (that are automatically set when a database container is linked with the name *db*).
	This docker container reads the configuration file `uaa.yml` from the `/uaa` folder. The container can accept configuration files from an URL, or from a shared volume. To run a UAA server with a configuration file in a shared volume, run this command:

--docker run -d --link uaa-db:db -v /tmp/uaa:/uaa:rw some/uaa:3.10.0
docker run -d --name tsome some/uaa:3.10.0
docker run -d --add-host=docker:10.x.y.z.253 --name some some/uaa:3.10.0

To get the configuration from an URL:
docker run -d --link uaa-db:db -e UAA_CONFIG_URL=https://raw.githubusercontent.com/sequenceiq/docker-uaa/master/uaa.yml xyz/123
