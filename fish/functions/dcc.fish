function dcc
  if test $args
    docker-compose rm --force --stop $argv 
  else
    docker-compose down -v --remove-orphans
  end
  
	docker-compose build $argv
	docker-compose up --remove-orphans --build -d $argv

	if test $CMD_DURATION
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
        set color -dim normal
        printf "it took "
        printf $duration
    end

	docker-compose logs -f $argv
end