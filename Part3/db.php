<?php
    $host = 'db.tecnico.ulisboa.pt';
    $user = 'ist180000';
    $pass = '<password>';
    $dsn = "mysql:host=$host;dbname=$user";

    try {
        return new PDO($dsn, $user, $pass);                        
    } catch(PDOException $ex) {
        echo("<p>ERROR: " . $ex->getMessage() . "</p>");
        exit();
    }
