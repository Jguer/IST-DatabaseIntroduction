<?php
    $host = 'db.tecnico.ulisboa.pt';
    $user = '***REMOVED***';
    $pass = '***REMOVED***';
    $dsn = "mysql:host=$host;dbname=$user";

    try {
        return new PDO($dsn, $user, $pass);
    } catch(PDOException $ex) {
        echo("<p>ERROR: " . $ex->getMessage() . "</p>");
        exit();
    }
