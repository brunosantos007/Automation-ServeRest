Param(
  [string]$BROWSER,
  [string]$TAG
)
docker run -v "$(pwd):/opt/jenkins" -e BROWSER=$BROWSER -e TAG=$TAG -P --name container-ruby  --link selenium-hub:selenium-hub cucumber/cucumber
docker exec container-ruby chmod -R 777 /opt/jenkins
docker rm -f container-ruby
docker rm -f selenium-hub