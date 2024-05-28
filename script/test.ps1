Param(
  [string]$BROWSER,
  [string]$TAG
)
docker run -v "$(pwd):/opt/jenkins/Gemfile.lock" -e BROWSER=$BROWSER -e TAG=$TAG -P --name container-ruby  --link selenium-hub:selenium-hub cucumber/cucumber
docker rm -f container-ruby
docker rm -f selenium-hub