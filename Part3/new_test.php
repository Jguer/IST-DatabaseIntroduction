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
  <?php include 'navbar3.php';?>

  <div>
    <h2>New Blood Test Insertion</h2>
    <?php

    $assist_vat = (empty($_REQUEST['assist_vat']) ? '' : $_REQUEST['assist_vat']);
    $white_cells = (empty($_REQUEST['white_cells']) ? '' : $_REQUEST['white_cells']);
    $neutrophils = (empty($_REQUEST['neutrophils']) ? '' : $_REQUEST['neutrophils']);
    $lymphocytes = (empty($_REQUEST['lymphocytes']) ? '' : $_REQUEST['lymphocytes']);
    $monocytes = (empty($_REQUEST['monocytes']) ? '' : $_REQUEST['monocytes']);
    $animal_vat = (empty($_REQUEST['animal_vat']) ? '' : $_REQUEST['animal_vat']);
    $date_timestamp = (empty($_REQUEST['date_timestamp']) ? '' : $_REQUEST['date_timestamp']);
    $animal_name = (empty($_REQUEST['animal_name']) ? '' : $_REQUEST['animal_name']);

    #echo("<p>PARAMETERS</p>");
    #echo($assist_vat);
    #echo($animal_name);
    #echo($animal_vat);
    #echo($date_timestamp);
    #echo($white_cells);
    #echo($neutrophils);
    #echo($lymphocytes);
    #echo($monocytes);

    /* enviar esta informacao a partir do consultdata.php*/

    $connection = require_once('db.php');


    #get procedure num
    $sql = "SELECT count(distinct vet_procedure.num) as n from vet_procedure
            where vet_procedure.name = '$animal_name'
                    and vet_procedure.vat_owner = '$animal_vat'
                    and vet_procedure.date_timestamp = '$date_timestamp'";
    $result = $connection->query($sql);
    if ($result == FALSE)
    {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
    }
    $row = $result->fetch();
    $n = $row['n'] + 1;

    $go = 1;
    $connection->beginTransaction();


    $sql = "INSERT INTO vet_procedure VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'blood test')";
    #este ultimo numero e o corresponde ao autoincrement da tabela do test_procedure

    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }

    $sql = "INSERT INTO test_procedure VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'blood')";

    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }


    $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'White Blood Cell Count', :white_cells)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':white_cells', $white_cells);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }

    /*alterar no INDICATOR do create tables para conter o white_cells, etc...*/


    $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'Number of Neutrophils', :neutrophils)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':neutrophils', $neutrophils);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }


    $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'Number of Lymphocytes', :lymphocytes)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':lymphocytes', $lymphocytes);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }


    $sql = "INSERT INTO produced_indicator VALUES (:animal_name, :animal_vat, :date_timestamp, :n, 'Number of Monocytes', :monocytes)";
    $sth = $connection->prepare($sql);
    $sth->bindParam(':animal_name', $animal_name);
    $sth->bindParam(':animal_vat', $animal_vat);
    $sth->bindParam(':date_timestamp', $date_timestamp);
    $sth->bindParam(':monocytes', $monocytes);
    $sth->bindParam(':n', $n);
    $sth->execute();
    if($sth->rowCount()==0){
        $go = 0;
    }

    if($go == 0){
        echo("Error during transaction.");
        $connection->rollback();
    }
    else{
        $connection->commit();
        echo("Transaction done.");
    }


    ?>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
