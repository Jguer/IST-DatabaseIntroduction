<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Vet Management System</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

</head>

<body>
<nav class="navbar navbar-default">
<div class="container-fluid">
<div class="navbar-header">
<a class="navbar-brand" href="#">Vet Management Systems</a>
</div>
<ul class="nav navbar-nav">
<li><a href="index.html">Home</a></li>
<li class="active"><a href="search.html">1 - Search and Insertion</a></li>
<li><a href="consult.html">2 - Consults</a></li>
<li><a href="registry.html">3 - Registry</a></li>
</ul>
</div>
</nav>

<div>
<h2>Search results</h2>
<?php
    
    $assist_vat = (empty($_REQUEST['assist_vat']) ? '' : $_REQUEST['assist_vat']);
    $white_cells = (empty($_REQUEST['white_cells']) ? '' : $_REQUEST['white_cells']);
    $neutrophils = (empty($_REQUEST['neutrophils']) ? '' : $_REQUEST['neutrophils']);
    $lymphocytes = (empty($_REQUEST['lymphocytes']) ? '' : $_REQUEST['lymphocytes']);
    $monocytes = (empty($_REQUEST['monocytes']) ? '' : $_REQUEST['monocytes']);
    $animal_vat = (empty($_REQUEST['animal_vat']) ? '' : $_REQUEST['animal_vat']);
    $date_timestamp = (empty($_REQUEST['date_timestamp']) ? '' : $_REQUEST['date_timestamp']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);
    
    /* enviar esta informacao a partir do consultdata.php*/
    
    $connection = require_once('db.php');
    
    $sql = "SELECT *
    FROM assistant
    where assistant.vat = :assist_vat";
    $result_assist = $connection->prepare($sql);
    if ($result_assist == FALSE)
    {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
    }
    
    if($result_assist->rowCount() == 0) {
        /*fazer o caso de aparecer na pagina que este assistente nao existe*/
    }
    else {
        
        $sql = "INSERT INTO vet_procedure VALUES (:animal_name, :animal_vat, :date_timestamp, '123213')";
        #este ultimo numero e o corresponde ao autoincrement da tabela do test_procedure
        
        $sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        $sth->execute();
        
        $sql = "INSERT INTO test_procedure VALUES (:animal_name, :animal_vat, :date_timestamp, '123213', :type)";
        
        sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        $sth->bindParam(':type', 'blood')
        $sth->execute();
        
        
        $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, '123213', 'White Blood Cells Count', :white_cells)";
        sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        $sth->bindParam(':white_cells', $white_cells);
        $sth->execute();
        
        /*alterar no INDICATOR do create tables para conter o white_cells, etc...*/
        
        
        $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, '123213', 'Number of neutrophils', :neutrophils)";
        sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        $sth->bindParam(':neutrophils', $neutrophils);
        $sth->execute();
        
        
        $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, '123213', 'Number of lymphocytes', :lymphocytes)";
        sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        $sth->bindParam(':lym', $neutrophils);
        $sth->execute();
        
        
        $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, '123213', 'Number of monocytes', :monocytes)";
        sth = $connection->prepare($sql);
        $sth->bindParam(':animal_name', $animal_name);
        $sth->bindParam(':animal_vat', $animal_vat);
        $sth->bindParam(':date_timestamp', $date_timestamp);
        
        $sth->execute();
        
    }
    
    ?>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
