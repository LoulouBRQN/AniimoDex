<?php
    use Slim\Factory\AppFactory;

    require_once __DIR__ . '/../src/Config/env.php';
    $appName = $_ENV['APP_NAME'];

    $app = AppFactory::create();
    $app->addRoutingMiddleware();
    $app->addBodyParsingMiddleware();   
    $app->addErrorMiddleware(true, true, true);
    $routes = require __DIR__ . '/../src/Routes/routes.php';
    $routes($app);
    $app->run();
?>