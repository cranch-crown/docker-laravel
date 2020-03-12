install:
        -cp -an .env.example .env
        -cp -an ./src/.env.example ./src/.env
        -cp -an php.ini ./docker/php-cli/php.ini
        -cp -an php.ini ./docker/php-fpm/php.ini
        docker-compose run --rm composer install
        docker-compose -f docker-compose.yml -f docker-compose.local.yml run --rm php-cli php artisan key:generate
        docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d mysql; sleep 10
        docker-compose -f docker-compose.yml -f docker-compose.local.yml run --rm php-cli php artisan migrate --seed
        docker-compose -f docker-compose.yml -f docker-compose.local.yml down
.PHONY: install

