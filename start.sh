cp .env.example .env
composer install
./vendor/bin/sail build && sleep 5
./vendor/bin/sail up -d --remove-orphans && sleep 5
./vendor/bin/sail down && sleep 2
./vendor/bin/sail up -d && sleep 2
./vendor/bin/sail artisan key:generate
./vendor/bin/sail artisan migrate:fresh --seed
./vendor/bin/sail artisan scribe:generate
./vendor/bin/sail artisan storage:link